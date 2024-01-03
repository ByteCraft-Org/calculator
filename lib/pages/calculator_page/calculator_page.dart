import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:calculator/pages/calculator_page/page_parts/scientific_buttons.dart';
import 'package:calculator/pages/calculator_page/page_parts/standard_buttons.dart';
import 'package:calculator/pages/calculator_page/page_parts/result_part.dart';
import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({super.key});

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  final CalculatorLogics logic = CalculatorLogics();

  void _onButtonPressed(String btnText){
    setState(() => logic.onButtonPressed(btnText));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ResultPart(logic: logic),
        const SizedBox(height: 5,),
        Divider(// * : Divider Line
        thickness: 2,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        const SizedBox(height: 5,),
        StandardButtons(logic: logic, onButtonPressed: _onButtonPressed),
      ],
    );
  }
}

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({super.key});

  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  final CalculatorLogics logic = CalculatorLogics();

  void _onButtonPressed(String btnText){
    setState(() => logic.onButtonPressed(btnText));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ResultPart(logic: logic),
        const SizedBox(height: 5,),
        Divider(// * : Divider Line
        thickness: 2,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        ScientificButtons(logic: logic, onButtonPressed: _onButtonPressed),
      ],
    );
  }
}