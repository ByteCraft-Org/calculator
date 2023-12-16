import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpAccentColor {
  static const String accentColorKey = 'accentColor';

  static Future<void> saveAccentColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(accentColorKey, color.value);
  }

  static Future<Color> loadAccentColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int colorValue = prefs.getInt(accentColorKey) ?? colorList[0].value;
    return Color(colorValue);
  }
}