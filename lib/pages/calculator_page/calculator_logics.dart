import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorLogics{
  String expressionText = ""; // * : Full Expression Text written by user.
  String validExpression = ""; // * : Expression should not contain symbols at end.
  double expressionFontSize = 40; // * : Set the Font of Expresstion Text.

  double result = 0; // * : Result for Evaluation.
  String resultText = "0"; // * : Result for Result Text Container.
  double resultFontSize = 60; // * : Set the Font of Result Text.
  Color resultColor = Colors.white; // * : Color of Result (Grey/White).
  bool isResultShown = false; // * : Checks if Equals to is pressed or not.

  void evaluate(String expression){
    print("Expression value = $expressionText");
    if(expressionText.isNotEmpty) {
      if(!_ExpressionHelper.isLastCharacterOperator(expression)  && !expression.endsWith(".")){ // * : If there is Operator at last of Expression Text it will not be considered as Valid Expression for Real Time Evaluation
        validExpression = expressionText;
        if(["/"].any(validExpression.contains)){ // * : Expression can't evaluate ÷, so converting  it into /.
          validExpression = validExpression.replaceAll("/", "÷");
        }
        try{
          print("Valid value = $expressionText");
          Parser p = Parser();
          Expression exp = p.parse(validExpression);
          ContextModel cm = ContextModel();
          result = exp.evaluate(EvaluationType.REAL, cm);
          resultText = result.toString();
          resultText = "= ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2)}";
        } catch(err){
          resultText = err.toString();
        }
      }
    }
  }

  void clearPressed(){
    expressionText = "";
    validExpression = "";
    expressionFontSize = 40;
    resultText = "0";
    resultFontSize = 60;
    resultColor = Colors.white;
    isResultShown = true;
  }

  void backspacePressed() { // * : This function removes the last character from the `expressionText` string
    expressionText = _ExpressionHelper.removeLastCharacterOfString(expressionText);
  }

  void equalsPressed(){
    resultFontSize = 60;
    expressionFontSize = 30;
    resultColor = Colors.white;
    isResultShown = true;
  }

  void onButtonPressed(String buttonText){
    switch(buttonText){
      case "clear": clearPressed(); return;
      case "backspace": backspacePressed(); break;
      case ".":
      case "=": equalsPressed(); break;

      default:
        addText(buttonText);
    }
    evaluate(expressionText);
  }

  void addText(String text) {
    expressionFontSize = 60;
    resultFontSize = 30;
    resultColor = Colors.grey;
    
    expressionText += text;
  }
}

class _ExpressionHelper{
  static String removeLastCharacterOfString(String expr){ // * : The function removes the last character from a given string and returns the modified string.
    return (expr.isEmpty) ? "" : (expr.length == 1) ? "0" : expr.substring(0, expr.length - 1);
  }

  static String getLastCharacterOfString(String text) { // * : This function returns the last character of a given string.
    return text.substring(text.length - 1);
  }

  static bool isLastCharacterOperator(String expr){ // * : The function checks if the last character of a given Expression is an operator.
    String lastCharacter = expr.isNotEmpty ? expr[expr.length - 1] : '';
    return ["+", "-", "*", "×", "/", "÷", "%"].contains(lastCharacter);
  }
  
  
  static bool isButtonTextOperator(String expr){ // * : The function checks if a given expression ends with any of the specified arithmetic operators.
    if(["+","-","*","×","/","÷","%"].any(expr.endsWith)){
      return true;
    }
    return false;
  }
}