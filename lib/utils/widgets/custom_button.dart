import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';

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
    this.textColor = primaryColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(transparentColor),
        overlayColor: MaterialStatePropertyAll(secondaryColor),
        shape: MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(70, 70)
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
  final Color iconColor;

  const CustomButtonWithIcon({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(transparentColor),
        overlayColor: MaterialStatePropertyAll(secondaryColor),
        shape: MaterialStatePropertyAll(
          CircleBorder(),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(70, 70)
        )
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 35,
      ),
    );
  }
}