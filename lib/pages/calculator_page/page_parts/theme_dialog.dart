import 'package:calculator/utils/shared_preferences/sp_accent_color.dart';
import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';

class ThemeDialog {
  static Future<void> setAccentColor(BuildContext context, Function(Color) updateAccentColor) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: themeDialogBgColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: List.generate(
                  colorList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      updateAccentColor(colorList[index]);
                      SpAccentColor.saveAccentColor(colorList[index]);
                      Navigator.of(context).pop();
                    },
                    child: CircleWidget(
                      color: colorList[index],
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircleWidget extends StatelessWidget {
  final Color color;
  final int index;

  const CircleWidget({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
