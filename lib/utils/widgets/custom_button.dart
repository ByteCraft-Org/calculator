import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWithText extends StatelessWidget {
  final Function() onTap;
  final String buttontext;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

  const CustomButtonWithText({
    super.key,
    required this.onTap,
    required this.buttontext,
    required this.textColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(60,60)
        )
      ),
      child: Text(
        buttontext,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight
        ),
      )
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color iconColor, bgColor;
  final double iconSize;

  const CustomButtonWithIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    this.bgColor = Colors.transparent,
    this.iconSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: const MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(60, 60)
        )
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}

class SvgButton extends StatelessWidget {
  final Function() onTap;
  final String assetPath;
  final Color bgColor, svgColor;
  final double height;

  const SvgButton({
    super.key,
    required this.onTap,
    required this.assetPath,
    this.bgColor = Colors.transparent,
    this.svgColor = Colors.grey,
    this.height = 25
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: const MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(60, 60)
        )
      ),
      child: SvgPicture.asset(
        assetPath,
        height: height,
        colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
      )
    );
  }
}

class CustomButtonWrap extends StatelessWidget {
  final Function() onTap;
  final Widget childern1, childern2, childern3;
  final Color bgColor;

  const CustomButtonWrap({
    super.key,
    required this.onTap,
    required this.childern1,
    required this.childern2,
    required this.childern3,
    this.bgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: const MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(60, 60)
        )
      ),
      child: Wrap(
        children: [
          childern1,
          childern2,
          childern3
        ],
      )
    );
  }
}

class ConverterTabButton extends StatelessWidget {
  final Function() onTap;
  final IconData? icon;
  final String label;
  final String? assetPath;

  const ConverterTabButton({
    super.key,
    required this.onTap,
    this.icon,
    required this.label,
    this.assetPath
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            (icon != null)
            ? Icon(
              icon,
              size: 30,
              color: Colors.grey,
            )
            : SvgPicture.asset(
              assetPath!,
              height: 30,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
            ),
            const SizedBox(height: 15),
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      )
    );
  }
}

class CustomConverterButton extends StatelessWidget {
  final Function() onPressed;
  final String? text;
  final IconData? icon;
  final bool showGoButton;

  const CustomConverterButton({
    super.key,
    required this.onPressed,
    this.text = "?",
    this.icon,
    this.showGoButton = false,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight = 180;
    if(showGoButton) {buttonHeight = 120;}

    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(60, buttonHeight),
        ),
      ),
      child: icon != null
      ? Icon(
          icon,
          color: Colors.orange,
          size: 35,
        )
      : Text(
          text!,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}

