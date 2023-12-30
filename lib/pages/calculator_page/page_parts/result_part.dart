// ignore_for_file: prefer_const_constructors

import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:flutter/material.dart';

class DisplayPart extends StatelessWidget {
  final CalculatorLogics logic;
  DisplayPart({
    super.key,
    required this.logic
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(// * : History
            flex: 8,
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
                    alignment: Alignment.bottomRight,
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        logic.expressionText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: logic.expressionFontSize
                        ),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Container(// * : Result Text
                    color: Colors.red,
                    child: Center(
                      child: Text("Result Part"),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 1.0)
          )
        ],
      ),
    );
  }
}
