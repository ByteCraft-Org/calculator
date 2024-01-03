import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool isDropdownOpen = false;
  bool isTrig2ndPage = false;
  bool ishyp = false;

  void _onButtonPressed(String buttonText) {
    isDropdownOpen = false;
    widget.onButtonPressed(buttonText);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(// * : Scientific Calculator
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => isDropdownOpen = !isDropdownOpen),
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.5))
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/calculator/trigonometry.svg", colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),height: 25),
                  const SizedBox(width: 10,),
                  const Text("Trigonometry", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () => setState(() => isDropdownOpen = false),
              child: _buildScientific()
            ),
          ],
        ),
        if(isDropdownOpen)
          Positioned(
            top: 60,
            child: Container(
              width: MediaQuery.of(context).size.width - 24,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(50, 50, 50, 1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: _buildTrignometry()
            )
          )
      ],
    );
  }

  Table _buildScientific() {
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
          onTap: () => _onButtonPressed("\u03C0"),
          buttontext: "\u03C0",
          textColor: Colors.purpleAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : e
          onTap: () => _onButtonPressed("e"),
          buttontext: "e",
          textColor: Colors.purpleAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Clear
          onTap: () => _onButtonPressed("clear"),
          buttontext: "C",
          textColor: Colors.yellowAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Backspace
          onTap: () => _onButtonPressed("backspace"),
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
          onTap: () => _onButtonPressed("²"),
          buttontext: "x²",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
        : CustomButtonWithText(// * : Cube
          onTap: () => _onButtonPressed("³"),
          buttontext: "x³",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Inverse
          onTap: () => _onButtonPressed("inverse"),
          buttontext: "1/x",
          textColor: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Positiive Numbers
          onTap: () => _onButtonPressed("positive"),
          icon: FontAwesomeIcons.squareRootVariable,
          iconColor: Colors.amber,
          iconSize: 30,
        ),
        CustomButtonWithText(// * : exp
          onTap: () => _onButtonPressed("exp"),
          buttontext: "exp",
          textColor: Colors.deepPurpleAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : mod
          onTap: () => _onButtonPressed("mod"),
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
          onTap: () => _onButtonPressed("\u{221A}"),
          buttontext: "²\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : Square Root
          onTap: () => _onButtonPressed("³\u{221A}"),
          buttontext: "³\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Open Bracket
          onTap: () => _onButtonPressed("("),
          buttontext: "(",
          textColor: Colors.indigoAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Close Bracket
          onTap: () => _onButtonPressed(")"),
          buttontext: ")",
          textColor: Colors.indigoAccent,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Factorial
          onTap: () => _onButtonPressed("!"),
          buttontext: "n!",
          textColor: Colors.tealAccent,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Divide
          onTap: () => _onButtonPressed("/"),
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
          onTap: () => _onButtonPressed("power"),
          buttontext: "x\u{02B8}",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : Power
          onTap: () => _onButtonPressed("rootPower"),
          buttontext: "\u{02B8}\u{221A}x",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Seven
          onTap: () => _onButtonPressed("7"),
          buttontext: "7",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Eight
          onTap: () => _onButtonPressed("8"),
          buttontext: "8",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Nine
          onTap: () => _onButtonPressed("9"),
          buttontext: "9",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Multiply
          onTap: () => _onButtonPressed("*"),
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
          onTap: () => _onButtonPressed("10powerX"),
          buttontext: "10\u{02E3}",
          textColor: Colors.amber,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : 2PowerX
          onTap: () => _onButtonPressed("2powerX"),
          buttontext: "2\u{02E3}",
          textColor: Colors.amber,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Four
          onTap: () => _onButtonPressed("4"),
          buttontext: "4",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => _onButtonPressed("5"),
          buttontext: "5",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => _onButtonPressed("6"),
          buttontext: "6",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Minus
          onTap: () => _onButtonPressed("-"),
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
          onTap: () => _onButtonPressed("log"),
          buttontext: "log",
          textColor: Colors.blue,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : logyx
          onTap: () => _onButtonPressed("logyx"),
          buttontext: "logᵧx",
          textColor: Colors.blue,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : One
          onTap: () => _onButtonPressed("1"),
          buttontext: "1",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => _onButtonPressed("2"),
          buttontext: "2",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => _onButtonPressed("3"),
          buttontext: "3",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Plus
          onTap: () => _onButtonPressed("+"),
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
          onTap: () => _onButtonPressed("ln"),
          buttontext: "ln",
          textColor: Colors.blue,
          fontSize: 25,
        )
        : CustomButtonWithText(// * : ePowerX
          onTap: () => _onButtonPressed("e\u{02E3}"),
          buttontext: "e\u{02E3}",
          textColor: Colors.blue,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : PlusMinus
        onTap: () => _onButtonPressed("+-"),
          icon: FontAwesomeIcons.plusMinus,
          iconColor: Colors.orange,
          iconSize: 25,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => _onButtonPressed("0"),
          buttontext: "0",
          textColor: Colors.white,
          fontSize: 25,
        ),
        CustomButtonWithIcon(// * : Decimal
          onTap: () => _onButtonPressed("."),
          icon: const IconData(46),
          iconColor: Colors.white,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Equals
          onTap: () => _onButtonPressed("="),
          icon: FontAwesomeIcons.equals,
          iconColor: Colors.white,
          bgColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    return Table(
      border: TableBorder.all(
        color: Colors.grey.withOpacity(0.5)
      ),
      children: [
        tableRow1, tableRow2, tableRow3, tableRow4, tableRow5, tableRow6, tableRow7
      ],
    );
  }

  Table _buildTrignometry() {
    CustomButtonWithText secondButton = CustomButtonWithText(// * : Button Toggle
      onTap: () => setState(() => isTrig2ndPage = !isTrig2ndPage),
      buttontext: "2\u207F\u1D48",
      textColor: (isTrig2ndPage) ? Colors.white : Colors.teal,
      bgColor: (isTrig2ndPage) ? Colors.teal : Colors.transparent,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    CustomButtonWithText hypButton = CustomButtonWithText(// * : Hyperbolic Toggle
      onTap: () => setState(() => ishyp = !ishyp),
      buttontext: "hyp",
      textColor: (ishyp) ? Colors.white : Colors.brown,
      bgColor: (ishyp) ? Colors.brown : Colors.transparent,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    CustomButtonWithText trigButton(String label) {
      return CustomButtonWithText(
        onTap: () {
          setState(() => isDropdownOpen = false);
          _onButtonPressed(label);
        },
        buttontext: label,
        textColor: Colors.cyan,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
    }
    
    TableRow trigTableRow1Normal = TableRow(// * : Button Toggle, Normal Functions
      children: [secondButton, trigButton("sin"), trigButton("cos"), trigButton("tan")],
    );

    TableRow trigTableRow2Normal = TableRow(// * : Hyperbolic Toggle, Normal Functions
      children: [hypButton, trigButton("sec"), trigButton("csc"), trigButton("cot")],
    );
    
    TableRow trigTableRow12nd = TableRow(// * : Button Toggle, Inverse Functions
      children: [secondButton, trigButton("sin⁻¹"), trigButton("cos⁻¹"), trigButton("tan⁻¹")],
    );

    TableRow trigTableRow22nd = TableRow(// * : Hyperbolic Toggle, Inverse Functions
      children: [hypButton, trigButton("sec⁻¹"), trigButton("csc⁻¹"), trigButton("cot⁻¹")],
    );

    TableRow trigTableRow1hyp = TableRow(// * : Button Toggle, Hyperbolic Functions
      children: [secondButton, trigButton("sinh"), trigButton("cosh"), trigButton("tanh")],
    );

    TableRow trigTableRow2hyp = TableRow(// * : Hyperbolic Toggle, Hyperbolic Functions
      children: [hypButton, trigButton("sech"), trigButton("csch"), trigButton("coth")],
    );

    TableRow trigTableRow1hyp2nd = TableRow(// * : Button Toggle, Inverse hyperbolic functions
      children: [secondButton, trigButton("sinh⁻¹"), trigButton("cosh⁻¹"), trigButton("tanh⁻¹"),],
    );

    TableRow trigTableRow2hyp2nd = TableRow(// * : Hyperbolic Toggle, Inverse hyperbolic functions
      children: [hypButton, trigButton("sech⁻¹"), trigButton("csch⁻¹"), trigButton("coth⁻¹")],
    );

    Table normalTrigTable = Table(
      border: TableBorder.all(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
      children: [trigTableRow1Normal, trigTableRow2Normal],
    );

    Table secondTrigTable = Table(
      border: TableBorder.all(color: Colors.grey.withOpacity(0.5)),
      children: [trigTableRow12nd, trigTableRow22nd],
    );

    Table hypTrigTable = Table(
      border: TableBorder.all(color: Colors.grey.withOpacity(0.5)),
      children: [trigTableRow1hyp, trigTableRow2hyp],
    );

    Table hyp2ndTrigTable = Table(
      border: TableBorder.all(color: Colors.grey.withOpacity(0.5)),
      children: [trigTableRow1hyp2nd, trigTableRow2hyp2nd],
    );

    if(isTrig2ndPage && !ishyp) {
      return secondTrigTable;
    } else if(!isTrig2ndPage && ishyp) {
      return hypTrigTable;
    } else if(isTrig2ndPage && ishyp) {
      return hyp2ndTrigTable;
    } else {
      return normalTrigTable;
    }
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
