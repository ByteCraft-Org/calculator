class CalculatorLogics{
  String expressionText = "0"; // * : Full Expression Text written by user.
  String validExpression = ""; // * : Expression should not contain symbols at end.
  double expressionFontSize = 40; // * : Set the Font of Expresstion Text.

  void clearPressed(){
    expressionText = "0";
    validExpression = "";
  }

  void backspacePressed() { // * : This function removes the last character from the `expressionText` string
    if(expressionText.length == 1) {
      expressionText = "0";
    } else {
      expressionText = _ExpressionHelper.removeLastCharacterOfString(expressionText);
    }
  }

  void onButtonPressed(String buttonText){
    if(expressionText == "0") {
      expressionText = buttonText;
    } else {
      switch(buttonText){
        case "clear": clearPressed(); break;
        case "backspace": backspacePressed(); break;
        case "%":
        case "/":
        case "*":
        case "-":
        case "+":
        case "0":
        case ".":
        case "=":

        default:
          addText(buttonText);
      }
    }
  }

  void addText(String text) => expressionText = expressionText + text;
}

class _ExpressionHelper{
  static String removeLastCharacterOfString(String expr){ // * : The function removes the last character from a given string and returns the modified string.
    expr = expr.substring(0, expr.length - 1);
    return expr;
  }
}