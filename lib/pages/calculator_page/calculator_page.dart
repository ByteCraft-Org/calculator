import 'package:calculator/pages/calculator_page/page_parts/button_part.dart';
import 'package:calculator/utils/values/colors.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
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
          thickness: 3,
            color: Theme.of(context).primaryColor.withOpacity(0.6),
          ),
          const SizedBox(height: 5,),
          const Align(// * : Button Segment
            alignment: Alignment.bottomCenter,
            child: ButtonPart(),
          ),
        ],
      ),
    );
  }
}
