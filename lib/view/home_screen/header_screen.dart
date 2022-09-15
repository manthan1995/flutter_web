import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constant/colors.dart';
import 'package:test_app/constant/image.dart';
import 'package:test_app/widgtes/custome_view.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: HeaderBakground(),
      child: Container(
        height: size.height / 1.5,
        color: ConstColor.backgroundColor,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deine Job \nwebsite',
                    style: TextStyle(
                      fontFamily: 'Lato Bold',
                      fontSize: size.height * 0.07,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width * 0.18,
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
                ],
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                width: size.width * 0.2,
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ConstColor.whiteColor,
                ),
                child: SvgPicture.asset(
                  ConstImage.headImage,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
