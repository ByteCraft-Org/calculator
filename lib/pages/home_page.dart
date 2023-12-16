import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
	final Function(Color) changeAccentColor;
  const HomePage({
		super.key,
		required this.changeAccentColor,
	});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CalculatorPage(changeAccentColor: changeAccentColor),
    );
  }
}
