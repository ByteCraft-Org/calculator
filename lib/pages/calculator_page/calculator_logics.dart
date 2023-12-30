class CalculatorLogics{
  String expressionText = "0"; // * : Full Expression Text written by user.
  String validExpression = ""; // * : Expression should not contain symbols at end.
  double expressionFontSize = 40; // * : Set the Font of Expresstion Text.

  void clearPressed(){
    expressionText = "0";
    validExpression = "";
  }

  void onButtonPressed(String buttonText){
    if(expressionText == "0") {
      expressionText = buttonText;
    } else {
      switch(buttonText){
        case "clear": clearPressed(); break;
        case "backspace":
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