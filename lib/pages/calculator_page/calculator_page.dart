import 'package:calculator/pages/calculator_page/page_parts/button_part.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(// * : Display Segment
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text("Display Part"),
            ),
          ),
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
