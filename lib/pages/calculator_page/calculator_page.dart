import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:calculator/pages/calculator_page/page_parts/button_part.dart';
import 'package:calculator/pages/calculator_page/page_parts/result_part.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final CalculatorLogics logic = CalculatorLogics();

  void _onButtonPressed(String btnText){
    setState(() => logic.onButtonPressed(btnText));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(// * : Display Segment
          child: DisplayPart(logic: logic),
        ),
        const SizedBox(height: 5,),
        Divider(// * : Divider Line
        thickness: 2,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        const SizedBox(height: 5,),
        SizedBox(// * : Button Segment
          child: ButtonPart(logic: logic, onButtonPressed: _onButtonPressed),
        ),
      ],
    );
  }
}
