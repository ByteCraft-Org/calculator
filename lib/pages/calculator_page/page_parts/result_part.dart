// ignore_for_file: prefer_const_constructors

import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:flutter/material.dart';

class ResultPart extends StatelessWidget {
  final CalculatorLogics logic;
  final bool isStandardButtons;

  const ResultPart({super.key, required this.logic, required this.isStandardButtons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Flexible(// * : History
            flex: (isStandardButtons) ? 6 : 4,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text("History Part"),
              ),
            ),
          ),
          Expanded(// * : Expression & Result
            flex: 3,
            child: Container(
            color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(// * : Expression Text
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      logic.expressionText,
                      style: TextStyle(
                        color: logic.expressionColor,
                        fontSize: logic.expressionFontSize
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                  ),
                  Container(// * : Result Text
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      logic.resultText,
                      style: TextStyle(
                        fontSize: logic.resultFontSize,
                        color: logic.resultColor,
                        fontWeight: (logic.resultColor == Colors.white) ? FontWeight.bold : FontWeight.normal
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
