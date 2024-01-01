import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorLogics{
  String expressionText = ""; // * : Full Expression Text written by user.
  Color expressionColor = Colors.white70; // * : Color of Result (Grey/White).
  double expressionFontSize = 30; // * : Set the Font of Expresstion Text.
  String validExpression = ""; // * : Expression should not contain symbols at end.

  double result = 0; // * : Result for Evaluation.
  String resultText = "0"; // * : Result for Result Text Container.
  double resultFontSize = 60; // * : Set the Font of Result Text.
  Color resultColor = Colors.white; // * : Color of Result (Grey/White).
  bool isResultShown = false; // * : Checks if Equals to is pressed or not.

  bool isMoreTextAllowed = true; // * : It determines whether more text can be added to the expression or not.

  bool sendToValidExpression() {
    if(expressionText.isEmpty) {return false;} // * : If expression text is empty then return.
    if(_ExpressionHelper.isLastCharacterOperator(expressionText)  && !expressionText.endsWith(".")) {return false;} // * : If there is Operator at last of Expression Text then return
    return true;
  }
  
  void evaluate(){
    if(!sendToValidExpression()) {return;} // * : If the expression is not valid, it will return and not continue with the evaluation.

    validExpression = expressionText; // * : create a separate variable that will be used for evaluating the expression without modifying the original `expressionText` variable.

    // * : Expression can't evaluate ÷,×, so converting  it into /,*.
    validExpression = validExpression.replaceAll("×", "*");
    validExpression = validExpression.replaceAll("÷", "/");
    validExpression = validExpression.replaceAll("\u03C0", pi.toString());
    validExpression = validExpression.replaceAll("e", e.toString());

    try{
      Parser p = Parser();
      Expression exp = p.parse(validExpression);
      ContextModel cm = ContextModel();
      result = exp.evaluate(EvaluationType.REAL, cm);
      resultText = result.toString();
      resultText = "= ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2)}";
    } catch(err){
      resultText = "Error";
    }
  }

  void resetValues(){
    expressionText = "";
    expressionColor = Colors.white;
    validExpression = "";
    result = 0;
    resultText = "0";
    resultColor = Colors.white;
		isResultShown = false;
    isMoreTextAllowed = true;
  }

  void clearPressed(){
    resetValues();
    expressionFontSize = 30;
    resultFontSize = 60;
  }

  void backspacePressed() {
    if(expressionText.length <= 1) {
      clearPressed();
      return;
    }
    expressionText = _ExpressionHelper.removeLastCharacterOfString(expressionText);
    if(isResultShown) {
      isResultShown = false;
      expressionFontSize = 60;
      resultFontSize = 30;
      resultColor = Colors.grey;
    }
  }

  void equalsPressed(){
    resultFontSize = 60;
    if (resultText.length > 8) {resultFontSize = 60 - (resultText.length - 8) * 2;}
    expressionFontSize = 30;
    resultColor = Colors.white;
    isResultShown = true;
  }

  void decimalPressed() {
    if(expressionText == "" || _ExpressionHelper.isLastCharacterOperator(expressionText)){ // * : If expression text is empty
      addText("0.");
    } else if(_ExpressionHelper.getLastNumber(expressionText,true).contains(".")) { // * : If there is already decimal in number, then don't add another decimal.
      return;
    } else {
      addText(".");
    }
  }

  void constantsCheck(String constant) {
    if(_ExpressionHelper.isLastCharacterNumber(expressionText)) {
      addText("×$constant");
    } else {
      addText(constant);
    }
  }

  void onButtonPressed(String buttonText){
    if(!isMoreTextAllowed && !["clear","backspace","="].any(buttonText.contains)){
      return;
    }
    switch(buttonText){
      // * : Basic Buttons
      case "clear": clearPressed(); return;
      case "backspace": backspacePressed(); break;
      case ".": decimalPressed(); break;
      case "=": equalsPressed(); return;

      // * : More Buttons Page 1
      case "pi": constantsCheck("\u03C0"); break;
      case "e": constantsCheck("e"); break;

      default:
        addText(buttonText);
    }
    evaluate();
    overflowAllowed();
  }

  void addText(String text) {
    expressionColor = Colors.white;
    resultFontSize = 30;
    resultColor = Colors.grey;

    if(isResultShown){ // * : When once Equals is pressed and then another button pressed, take result as expression.
      expressionText = resultText.replaceFirst("= ", "");
      isResultShown = false;
      if(_ExpressionHelper.isButtonTextOperator(text)){
        expressionText = resultText.replaceFirst("= ", "");
      } else{
        expressionText = "";
      }
    }

    if(_ExpressionHelper.isButtonTextOperator(text) && expressionText.isEmpty) {clearPressed(); return;}

    if(_ExpressionHelper.isButtonTextOperator(text) && _ExpressionHelper.isLastCharacterOperator(expressionText)) { // * : If Button Text is Operator and Last Character of Expression Text is Operator, then replace the Operator from expression text.
      expressionText = _ExpressionHelper.removeLastCharacterOfString(expressionText);
    }

    if(_ExpressionHelper.isLastCharacterConstants(expressionText)) {text = "×$text";} // * : If Last Character of Expression Text is Constants, then add "×" before the text.

    switch(text){
      case "*":
        text = "×";
        break;
      case "/":
        text = "÷";
        break;
    }

    expressionText += text;
  }

  void overflowAllowed() {
    if(expressionText.isNotEmpty) {
      if (expressionText.length < 8) {
        expressionFontSize = 60;
      } else if (expressionText.length <= 14) {
        expressionFontSize = 60 - (expressionText.length - 8) * 3;
      } else {
        expressionFontSize = 39;
        isMoreTextAllowed = false;
        return;
      }
      isMoreTextAllowed = true;
    }
  }
}

class _ExpressionHelper{
  List<String> operators = ["+", "-", "*", "×", "/", "÷", "%"];
  List<String> numbers = ["1","2","3","4","5","6","7","8","9","0"];
  List<String> constants = ["\u03C0", "e"];

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

  static bool isLastCharacterNumber(String expr){ // * : The function checks if the last character of a given Expression is a number.
    String lastCharacter = expr.isNotEmpty ? expr[expr.length - 1] : '';
    return ["1","2","3","4","5","6","7","8","9","0"].contains(lastCharacter);
  }

  static bool isLastCharacterConstants(String expr){ // * : The function checks if the last character of a given Expression is a number.
    String lastCharacter = expr.isNotEmpty ? expr[expr.length - 1] : '';
    return ["\u03C0","e"].contains(lastCharacter);
  }

  static bool isButtonTextOperator(String expr){ // * : The function checks if a given expression ends with any of the specified arithmetic operators.
    if(["+","-","*","×","/","÷","%"].any(expr.endsWith)){
      return true;
    }
    return false;
  }

  // * : This function extracts 
  // * : options = true => The number after the last Operator from a given expression.
  // * : options = false => The number before the last Operator from a given expression.
  static String getLastNumber(String expr, [bool options = true]) {
    final RegExp numberPattern = RegExp(r'[-+*÷%/×]');
    final matches = numberPattern.allMatches(expr);
    final matchIndices = [0, ...matches.map((match) => match.end)];
    int lastOperatorIndex = matchIndices.last;
    String result;

    if (options) {
      result = expr.substring(lastOperatorIndex);
    } else {
      result = expr.substring(0, lastOperatorIndex - 1);
    }
    return result;
  }
}