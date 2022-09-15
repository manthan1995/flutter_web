import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constant/colors.dart';
import 'package:test_app/constant/image.dart';
import 'package:test_app/widgtes/custome_view.dart';

class MobileView extends StatelessWidget {
  int selectedLable;
  MobileView({Key? key, required this.selectedLable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: SizedBox(
            child: Text(
              selectedLable == 0
                  ? 'Drei einfache Schritte zu deinem neuen Job'
                  : selectedLable == 1
                      ? 'Drei einfache Schritte zu deinem neuen Mitarbeiter'
                      : 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato Medium',
                fontSize: size.height * 0.04,
                color: ConstColor.blackGreyColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.35,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '1.',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    height: 0.1,
                    fontSize: size.height * 0.15,
                    color: ConstColor.blackGreyColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.5,
                      child: SvgPicture.asset(
                        ConstImage.firstImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        selectedLable == 0
                            ? 'Erstellen dein Lebenslauf'
                            : selectedLable == 1
                                ? 'Erstellen dein Unternehmensporofil'
                                : 'Erstellen dein Unternehmensporofil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          color: ConstColor.blackGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        ClipPath(
          clipper: MobileCenterBackground(),
          child: Container(
            height: size.height * 0.4,
            color: ConstColor.backgroundColor,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: size.height * 0.2,
                    width: size.width * 0.5,
                    child: SvgPicture.asset(
                      ConstImage.secondImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '2.',
                        style: TextStyle(
                          height: 1,
                          fontSize: size.height * 0.15,
                          color: ConstColor.blackGreyColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Text(
                            selectedLable == 0
                                ? 'Erstellen dein Lebenslauf'
                                : selectedLable == 1
                                    ? 'Erstellen ein Jobinserat'
                                    : 'Erstellen Vermittlung angebot von Arbeitgeber',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.height * 0.03,
                              color: ConstColor.blackGreyColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.4,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '3.',
                      style: TextStyle(
                        fontSize: size.height * 0.15,
                        color: ConstColor.blackGreyColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        selectedLable == 0
                            ? 'Mit nur einem Klick bewerben'
                            : selectedLable == 1
                                ? 'Wahle deinen neuen Mitarbeiter aus'
                                : 'Vermittlung nach Provision oder Stundenlohn',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          color: ConstColor.blackGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.2,
                    width: size.width,
                    child: SvgPicture.asset(
                      ConstImage.thirdImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
