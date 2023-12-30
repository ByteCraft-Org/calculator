import 'package:calculator/pages/calculator_page/page_parts/button_part.dart';
import 'package:calculator/pages/calculator_page/page_parts/result_part.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(// * : Display Segment
          child: DisplayPart(),
        ),
        const SizedBox(height: 5,),
        Divider(// * : Divider Line
        thickness: 2,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        const SizedBox(height: 5,),
        const SizedBox(// * : Button Segment
          child: ButtonPart(),
        ),
      ],
    );
  }
}
