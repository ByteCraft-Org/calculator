import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CalculatorPage(),
    );
  }
}
