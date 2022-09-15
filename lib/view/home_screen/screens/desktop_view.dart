import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constant/colors.dart';
import 'package:test_app/constant/image.dart';
import 'package:test_app/widgtes/custome_view.dart';

class DesktopView extends StatelessWidget {
  int selectedLable;
  DesktopView({Key? key, required this.selectedLable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        _buildTitle(size, selectedLable),
        SizedBox(
          height: size.height * 0.05,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                _buildFirstRow(size),
                SizedBox(
                  height: size.height * 0.17,
                ),
                _buildSecondRow(size),
                SizedBox(
                  height: size.height * 0.1,
                ),
                _buildThirdRow(size),
              ],
            ),
            Positioned(
              top: 0,
              left: size.width * 0.25,
              bottom: size.height * 0.5,
              child: SvgPicture.asset(
                ConstImage.firstArrowImage,
                width: size.width * 0.4,
                height: size.height * 0.4,
              ),
            ),
            Positioned(
              top: size.height * 0.45,
              left: size.width * 0.25,
              bottom: 0,
              child: SvgPicture.asset(
                ConstImage.secondeArrowImage,
                width: size.width * 0.4,
                height: size.height * 0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _buildThirdRow(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '3.',
            style: TextStyle(
              height: 0.4,
              fontSize: size.height * 0.1,
              color: ConstColor.textColor,
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
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
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.07),
            child: SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.2,
              child: SvgPicture.asset(
                selectedLable == 0
                    ? ConstImage.thirdImage
                    : selectedLable == 1
                        ? ConstImage.third2Image
                        : ConstImage.third3Image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipPath _buildSecondRow(Size size) {
    return ClipPath(
      clipper: CenterBackground(),
      child: Container(
        height: size.height * 0.3,
        color: ConstColor.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(left: size.width * 0.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: size.height * 0.05, top: size.height * 0.02),
                child: SizedBox(
                  height: size.height * 0.25,
                  width: size.width * 0.15,
                  child: SvgPicture.asset(
                    selectedLable == 0
                        ? ConstImage.secondImage
                        : selectedLable == 1
                            ? ConstImage.second2Image
                            : ConstImage.second3Image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Text(
                '2.',
                style: TextStyle(
                  height: 0.4,
                  fontSize: size.height * 0.1,
                  color: ConstColor.textColor,
                ),
              ),
              SizedBox(
                width: size.width * 0.2,
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
        ),
      ),
    );
  }

  Widget _buildFirstRow(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '1.',
            style: TextStyle(
              height: 0.4,
              fontSize: size.height * 0.1,
              color: ConstColor.textColor,
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
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
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.07),
            child: SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.2,
              child: SvgPicture.asset(
                ConstImage.firstImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTitle(Size size, int selectedLable) {
  return SizedBox(
    width: size.width * 0.19,
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
          fontSize: size.height * 0.03,
          color: ConstColor.blackGreyColor,
        ),
      ),
    ),
  );
}
