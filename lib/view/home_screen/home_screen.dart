import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constant/colors.dart';
import 'package:test_app/constant/image.dart';
import 'package:test_app/view/home_screen/screens/desktop_view.dart';
import 'package:test_app/view/home_screen/header_screen.dart';
import 'package:test_app/view/home_screen/screens/mobile_view.dart';
import 'package:test_app/widgtes/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedLable = 0;
  bool isHeader = false;
  double height = 0;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    controller.addListener(() {
      if (controller.position.pixels > MediaQuery.of(context).size.height) {
        isHeader = false;
        height = 500;

        setState(() {});
      }
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        height = 0;
        isHeader = true;

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                if (Responsive.isDesktop(context)) ...[
                  const HeaderScreen(),
                ] else ...[
                  _buildMobileHeader(size),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: Container(
                      height: size.height * 0.05,
                      width: 500,
                      decoration: BoxDecoration(
                        color: ConstColor.dividerColor,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(12),
                          right: Radius.circular(12),
                        ),
                        border: Border.all(
                            color: ConstColor.dividerColor, width: 1),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: ConstColor.whiteColor,
                        labelPadding: EdgeInsets.zero,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.black,
                        onTap: (value) {
                          setState(() {
                            selectedLable = value;
                          });
                        },
                        tabs: [
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: selectedLable == 0
                                      ? ConstColor.tabColor
                                      : ConstColor.whiteColor,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(12),
                                  ),
                                ),
                                child:
                                    const Center(child: Text('Arbeitnehmer')),
                              ),
                              const VerticalDivider(
                                color: ConstColor.dividerColor,
                                width: 2,
                                thickness: 3,
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: selectedLable == 1
                                      ? ConstColor.tabColor
                                      : ConstColor.whiteColor,
                                ),
                                child:
                                    const Center(child: Text('Arbeitnehmer')),
                              ),
                              const VerticalDivider(
                                color: ConstColor.dividerColor,
                                width: 2,
                                thickness: 3,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: selectedLable == 2
                                  ? ConstColor.tabColor
                                  : ConstColor.whiteColor,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(12),
                              ),
                            ),
                            child: const Center(
                              child: Text('Arbeitnehmer'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                if (Responsive.isDesktop(context)) ...[
                  DesktopView(selectedLable: selectedLable),
                ] else ...[
                  MobileView(selectedLable: selectedLable),
                ]
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildappBar(size),
              if (!Responsive.isDesktop(context)) ...[
                _buildMobileButton(size),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeader(Size size) {
    return Column(
      children: [
        Container(
          height: size.height / 1.05,
          width: size.width,
          color: ConstColor.backgroundColor,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Deine Job \nwebsite',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato Bold',
                  fontSize: size.height * 0.06,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height / 1.5,
                child: SvgPicture.asset(
                  ConstImage.headImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileButton(Size size) {
    return Container(
      height: size.height * 0.1,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size.height * 0.02),
          topRight: Radius.circular(size.height * 0.02),
        ),
        boxShadow: const [
          BoxShadow(
              color: Colors.black54, blurRadius: 5.0, offset: Offset(0.0, 0.75))
        ],
        color: ConstColor.whiteColor,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Container(
            width: size.width,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  ConstColor.zompColor,
                  ConstColor.darkBlueColor,
                ],
              ),
              color: Colors.deepPurple.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Kostenlos Registrieren',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato Semibold',
                  color: ConstColor.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PhysicalModel _buildappBar(Size size) {
    return PhysicalModel(
      elevation: 5,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(10),
      ),
      color: ConstColor.shadowColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(10),
        ),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.06,
          child: Container(
            decoration: const BoxDecoration(
              color: ConstColor.whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [
                          ConstColor.zompColor,
                          ConstColor.darkBlueColor,
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.height * 0.05),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Lato Semibold',
                        color: ConstColor.zompColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabbar(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        height: size.height * 0.05,
        width: Responsive.isDesktop(context) ? size.width * 0.3 : size.width,
        decoration: BoxDecoration(
          color: ConstColor.dividerColor,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
          border: Border.all(color: ConstColor.dividerColor, width: 1),
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: ConstColor.whiteColor,
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black,
          onTap: (value) {
            setState(() {
              selectedLable = value;
            });
          },
          tabs: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: selectedLable == 0
                        ? ConstColor.tabColor
                        : ConstColor.whiteColor,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                  ),
                  child: const Center(child: Text('Arbeitnehmer')),
                ),
                const VerticalDivider(
                  color: ConstColor.dividerColor,
                  width: 2,
                  thickness: 3,
                ),
              ],
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: selectedLable == 1
                        ? ConstColor.tabColor
                        : ConstColor.whiteColor,
                  ),
                  child: const Center(child: Text('Arbeitnehmer')),
                ),
                const VerticalDivider(
                  color: ConstColor.dividerColor,
                  width: 2,
                  thickness: 3,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: selectedLable == 2
                    ? ConstColor.tabColor
                    : ConstColor.whiteColor,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Text('Arbeitnehmer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
