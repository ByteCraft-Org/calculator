import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScientificButtons extends StatefulWidget {
  final Function(String) onButtonPressed;
  final CalculatorLogics logic;

  const ScientificButtons({
    super.key,
    required this.logic,
    required this.onButtonPressed,
  });

  @override
  State<ScientificButtons> createState() => _ScientificButtonsState();
}

class _ScientificButtonsState extends State<ScientificButtons> {
  bool is2ndPage = false;
  @override
  Widget build(BuildContext context) {
    TableRow tableRow1 = TableRow(// * : Button Toggle, Pi, e, Clear, Backspace
      children: [
        CustomButtonWithText(// * : Button Toggle
          onTap: () => setState(() => is2ndPage = !is2ndPage),
          buttontext: "2\u207F\u1D48",
          textColor: (is2ndPage) ? Colors.black : Colors.yellowAccent,
          bgColor: (is2ndPage) ? Colors.yellowAccent : Colors.transparent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Pi
          onTap: () => widget.onButtonPressed("\u03C0"),
          buttontext: "\u03C0",
          textColor: Colors.purpleAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : e
          onTap: () => widget.onButtonPressed("e"),
          buttontext: "e",
          textColor: Colors.purpleAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Clear
          onTap: () => widget.onButtonPressed("clear"),
          buttontext: "C",
          textColor: Colors.yellowAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Backspace
          onTap: () => widget.onButtonPressed("backspace"),
          icon: Icons.backspace,
          iconColor: Colors.yellowAccent,
          iconSize: 20,
        ),
      ],
    );

    TableRow tableRow2 = TableRow(// * : Square || Cube, Inverse, Positive Numbers, exp, mod
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : Square
          onTap: () => widget.onButtonPressed("²"),
          buttontext: "x²",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
        : CustomButtonWithText(// * : Square
          onTap: () => widget.onButtonPressed("³"),
          buttontext: "x³",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Inverse
          onTap: () => widget.onButtonPressed("inverse"),
          buttontext: "1/x",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Positiive Numbers
          onTap: () => widget.onButtonPressed("positive"),
          icon: FontAwesomeIcons.squareRootVariable,
          iconColor: Colors.amber,
          iconSize: 30,
        ),
        CustomButtonWithText(// * : exp
          onTap: () => widget.onButtonPressed("exp"),
          buttontext: "exp",
          textColor: Colors.deepPurpleAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : mod
          onTap: () => widget.onButtonPressed("mod"),
          buttontext: "mod",
          textColor: Colors.orange,
          fontSize: 25,
        )
      ],
    );

    TableRow tableRow3 = TableRow(// * : Square root || Cube root, Open Bracket, Close bracket, Factorial, Divide
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : Square Root
          onTap: () => widget.onButtonPressed("\u{221A}"),
          buttontext: "²\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : Square Root
          onTap: () => widget.onButtonPressed("³\u{221A}"),
          buttontext: "³\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Open Bracket
          onTap: () => widget.onButtonPressed("("),
          buttontext: "(",
          textColor: Colors.indigoAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Close Bracket
          onTap: () => widget.onButtonPressed(")"),
          buttontext: ")",
          textColor: Colors.indigoAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Factorial
          onTap: () => widget.onButtonPressed("!"),
          buttontext: "n!",
          textColor: Colors.tealAccent,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Divide
          onTap: () => widget.onButtonPressed("/"),
          icon: FontAwesomeIcons.divide,
          iconColor: Colors.orange,
          iconSize: 25,
        )
      ],
    );

    TableRow tableRow4 = TableRow(// * : Power || Root Power, 7, 8, 9, Multiply
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : Power
          onTap: () => widget.onButtonPressed("power"),
          buttontext: "x\u{02B8}",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : Power
          onTap: () => widget.onButtonPressed("rootPower"),
          buttontext: "\u{02B8}\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Seven
          onTap: () => widget.onButtonPressed("7"),
          buttontext: "7",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Eight
          onTap: () => widget.onButtonPressed("8"),
          buttontext: "8",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Nine
          onTap: () => widget.onButtonPressed("9"),
          buttontext: "9",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Multiply
          onTap: () => widget.onButtonPressed("*"),
          icon: FontAwesomeIcons.xmark,
          iconColor: Colors.orange,
          iconSize: 25,
        )
      ],
    );

    TableRow tableRow5 = TableRow(// * : 10PowerX || 2powerX, 4, 5, 6, Minus
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : 10PowerX
          onTap: () => widget.onButtonPressed("10powerX"),
          buttontext: "10\u{02E3}",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : 2PowerX
          onTap: () => widget.onButtonPressed("2powerX"),
          buttontext: "2\u{02E3}",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Four
          onTap: () => widget.onButtonPressed("4"),
          buttontext: "4",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => widget.onButtonPressed("5"),
          buttontext: "5",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => widget.onButtonPressed("6"),
          buttontext: "6",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Minus
          onTap: () => widget.onButtonPressed("-"),
          icon: FontAwesomeIcons.minus,
          iconColor: Colors.orange,
          iconSize: 25,
        )
      ],
    );

    TableRow tableRow6 = TableRow(// * : log || logxy, 1, 2, 3, Plus
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : log
          onTap: () => widget.onButtonPressed("log"),
          buttontext: "log",
          textColor: Colors.blue,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : logyx
          onTap: () => widget.onButtonPressed("logyx"),
          buttontext: "logᵧx",
          textColor: Colors.blue,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : One
          onTap: () => widget.onButtonPressed("1"),
          buttontext: "1",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => widget.onButtonPressed("2"),
          buttontext: "2",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => widget.onButtonPressed("3"),
          buttontext: "3",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Plus
          onTap: () => widget.onButtonPressed("+"),
          icon: FontAwesomeIcons.plus,
          iconColor: Colors.orange,
          iconSize: 25,
        )
      ],
    );

    TableRow tableRow7 = TableRow(// * : ln || ePowerX, PlusMinus, 0, Decimal, Equals
      children: [
        (!is2ndPage)
        ? CustomButtonWithText(// * : ln
          onTap: () => widget.onButtonPressed("ln"),
          buttontext: "ln",
          textColor: Colors.blue,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : ePowerX
          onTap: () => widget.onButtonPressed("e\u{02E3}"),
          buttontext: "e\u{02E3}",
          textColor: Colors.blue,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : PlusMinus
        onTap: () => widget.onButtonPressed("+-"),
          icon: FontAwesomeIcons.plusMinus,
          iconColor: Colors.orange,
          iconSize: 25,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => widget.onButtonPressed("0"),
          buttontext: "0",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Decimal
          onTap: () => widget.onButtonPressed("."),
          icon: const IconData(46),
          iconColor: Colors.white,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Equals
          onTap: () => widget.onButtonPressed("="),
          icon: FontAwesomeIcons.equals,
          iconColor: Colors.white,
          bgColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    return Table(// * : Scientific Calculator
      border: TableBorder.all(
        color: Colors.grey.withOpacity(0.5)
      ),
      children: [
        tableRow1, tableRow2, tableRow3, tableRow4, tableRow5, tableRow6, tableRow7
      ],
    );
  }
}

class CustomButtonWithText extends StatelessWidget {
  final Function() onTap;
  final String buttontext;
  final Color textColor, bgColor;
  final FontWeight fontWeight;
  final double fontSize;

  const CustomButtonWithText({
    super.key,
    required this.onTap,
    required this.buttontext,
    required this.textColor,
    this.bgColor = Colors.transparent,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: const MaterialStatePropertyAll(LinearBorder()),
        minimumSize: const MaterialStatePropertyAll(Size(50,50)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero)
      ),
      child: Text(
        buttontext,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight
        ),
      )
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color iconColor, bgColor;
  final double iconSize;

  const CustomButtonWithIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    this.bgColor = Colors.transparent,
    this.iconSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
        shape: const MaterialStatePropertyAll(LinearBorder()),
        minimumSize: const MaterialStatePropertyAll(Size(50, 50)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero)
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}