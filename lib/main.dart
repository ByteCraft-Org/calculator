import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        primaryColor: primaryColor,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: colorList[0],
        ),
      ),
      home: const HomePage(),
    );
  }
}
