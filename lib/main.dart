import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/shared_preferences/sp_accent_color.dart';
import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Color accentColor = colorList[0];

  @override
  void initState() {
    loadAccentColor();
    super.initState();
  }

  void loadAccentColor() async {
    Color loadedColor = await SpAccentColor.loadAccentColor();
    setState(() {
      accentColor = loadedColor;
    });
  }

  void changeAccentColor(Color newColor) async {
    setState(() {
      accentColor = newColor;
    });
    await SpAccentColor.saveAccentColor(newColor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: const Color(0xFFFFFFFF),        
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          //secondary: const Color(0xff65ffa0),
          secondary: Colors.orange,
        ),
      ),
      home: const HomePage(),
    );
  }
}