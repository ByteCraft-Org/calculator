import 'package:calculator/utils/values/colors.dart';
import 'package:calculator/utils/values/dimensions.dart';
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
          SizedBox(// * : Display Segment
            height: screenHeight(context) * 0.45,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text("Display Part"),
              ),
            ),
          ),
          Container(// * : Separator Line
            height: 1,
            color: Theme.of(context).primaryColor.withOpacity(0.6),
          ),
          SizedBox(// * : Button Segment
            height: screenHeight(context) * 0.45,
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text("Button Part"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
