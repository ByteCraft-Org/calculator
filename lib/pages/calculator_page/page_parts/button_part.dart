import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonPart extends StatefulWidget {
  final Function(String) onButtonPressed;
  final CalculatorLogics logic;

  const ButtonPart({
    super.key,
    required this.logic,
    required this.onButtonPressed,
  });

  @override
  State<ButtonPart> createState() => _ButtonPartState();
}

class _ButtonPartState extends State<ButtonPart> {
  double moreButtonsContainerPosition = 0.0;
  bool moreButtons = true;
  int moreButtonsPage = 1;
  bool isHyp = false;

  closeMoreButtons() => setState(() =>  moreButtonsContainerPosition = -1.0);

  @override
  Widget build(BuildContext context) {
    TableRow tableRow1 =TableRow(// * : Clear, Backspace, Percent, Divide
      children: [
        CustomButtonWithText(// * : Clear
          onTap: () => widget.onButtonPressed("clear"),
          buttontext: "C",
          textColor: Colors.orange,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Backspace
          onTap: () => widget.onButtonPressed("backspace"),
          icon: Icons.backspace,
          iconColor: Colors.orange,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Percent
          onTap: () => widget.onButtonPressed("%"),
          icon: FontAwesomeIcons.percent,
          iconColor: Colors.orange,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Divide
          onTap: () => widget.onButtonPressed("/"),
          icon: FontAwesomeIcons.divide,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow2 = TableRow(// * : 7, 8, 9, Multiply
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => widget.onButtonPressed("7"),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Eight
          onTap: () => widget.onButtonPressed("8"),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Nine
          onTap: () => widget.onButtonPressed("9"),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Multiply
          onTap: () => widget.onButtonPressed("*"),
          icon: FontAwesomeIcons.xmark,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow3 = TableRow(// * : 4, 5, 6, Subtract
      children: [
        CustomButtonWithText(// * : Four
          onTap: () => widget.onButtonPressed("4"),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => widget.onButtonPressed("5"),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => widget.onButtonPressed("6"),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Subtract
          onTap: () => widget.onButtonPressed("-"),
          icon: FontAwesomeIcons.minus,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow4 = TableRow(// * : 1, 2, 3, Add
      children: [
        CustomButtonWithText(// * : One
          onTap: () => widget.onButtonPressed("1"),
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => widget.onButtonPressed("2"),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => widget.onButtonPressed("3"),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Add
          onTap: () => widget.onButtonPressed("+"),
          icon: FontAwesomeIcons.plus,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow5 = TableRow(// * : Expand, 0, Decimal, Equals
      children: [
        CustomButtonWithIcon(// * : Expand
        onTap: () => setState(() => moreButtonsContainerPosition = 0.0),
          icon: FontAwesomeIcons.arrowRight,
          iconColor: Colors.orange,
          iconSize: 25,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => widget.onButtonPressed("0"),
          buttontext: "0",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Decimal
          onTap: () => widget.onButtonPressed("."),
          icon: const IconData(46),
          iconColor: Theme.of(context).primaryColor,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Equals
          onTap: () => widget.onButtonPressed("="),
          icon: FontAwesomeIcons.equals,
          iconColor: Theme.of(context).primaryColor,
          bgColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    return Stack(
      children: [
        Table(// * : Calculator Basic Buttons
          children: [
            tableRow1, tableRow2, tableRow3, tableRow4, tableRow5
          ],
        ),
        AnimatedContainer(// * : Calculator more buttons
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(moreButtonsContainerPosition * MediaQuery.of(context).size.width, 0, 0),
          color: (moreButtonsContainerPosition >= -0.9) ? Colors.black.withOpacity(0.7) : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          child: _moreButtons()
        )
      ],
    );
  }

  Widget _moreButtons() {
    Color cellColor = Colors.deepPurple;

    TableRow page1Row1 = TableRow(// * : Page changer, Hyperbolic, Square root
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => setState(() => moreButtonsPage = 2),
            buttontext: "\u{21C6}2nd",
            fontSize: 18,
            textColor: Colors.greenAccent,
          ),
        ),
        Container(
          height: 64,
          color: (isHyp) ? Colors.amber : cellColor,
          child: CustomButtonWithText(
            onTap: () => setState(() => isHyp = !isHyp),
            buttontext: "hyp",
            fontSize: 20,
            textColor: (isHyp) ? Colors.red : Colors.redAccent,
          ),
        ),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: cellColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20))
          ),
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("sqroot"),
            buttontext: "\u{221A}x",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page1Row2IsNotHyp = TableRow(// * : Sin, Cos, Tan
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("sin"),
            buttontext: "sin",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("cos"),
            buttontext: "cos",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("tan"),
            buttontext: "tan",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page1Row2IsHyp = TableRow(// * : Sinh, Cosh, Tanh
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("sinh"),
            buttontext: "sinh",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("cosh"),
            buttontext: "cosh",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("tanh"),
            buttontext: "tanh",
            fontSize: 20,
            textColor: Colors.cyanAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page1Row3 = TableRow(// * : Open braces, Close braces, 1/x
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("("),
            buttontext: "(",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed(")"),
            buttontext: ")",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("1/x"),
            buttontext: "1/x",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page1Row4 = TableRow(// * : e^x, x^2, x^y
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("e^x"),
            buttontext: "e\u{02E3}",
            fontSize: 20,
            textColor: Colors.orangeAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("sq"),
            buttontext: "x\u00B2",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("pow"),
            buttontext: "x\u02B8",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page1Row5 = TableRow(// * : Mod, Pi, Euler, Back
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("mod"),
            buttontext: "|X|",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("pi"),
            buttontext: "\u03C0",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => widget.onButtonPressed("e"),
            buttontext: "e",
            fontSize: 20,
            textColor: Colors.orangeAccent,
          ),
        ),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: cellColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: CustomButtonWithIcon(
            onTap: () => setState(() => closeMoreButtons()),
            icon: FontAwesomeIcons.arrowLeft,
            iconColor: Colors.pinkAccent,
            iconSize: 30,
          ),
        ),
      ]
    );

    Table page1table = Table(
      children: [
        page1Row1,
        (isHyp) ? page1Row2IsHyp : page1Row2IsNotHyp,
        page1Row3, page1Row4, page1Row5
      ],
    );

    TableRow page2Row1 = TableRow(// * : Page changer, Hyperbolic, Cube root
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: () => setState(() => moreButtonsPage = 1),
            buttontext: "\u{21C6}1st",
            fontSize: 20,
            textColor: Colors.greenAccent,
          )
        ),
        Container(
          height: 64,
          color: (isHyp) ? Colors.amber : cellColor,
          child: CustomButtonWithText(
            onTap: () => setState(() => isHyp = !isHyp),
            buttontext: "hyp",
            fontSize: 20,
            textColor: (isHyp) ? Colors.red : Colors.redAccent,
          ),
        ),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: cellColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20))
          ),
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "\u{00B3}\u{221A}x",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page2Row2IsNotHyp = TableRow(// * : Sin^-1, Cos^-1, Tan^-1
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 20,
            buttontext: "sin\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 20,
            buttontext: "cos\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 20,
            buttontext: "tan\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page2Row2IsHyp = TableRow(// * : Sinh^-1, Cosh^-1, Tanh^-1
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 18,
            buttontext: "sinh\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 17,
            buttontext: "cosh\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 18,
            buttontext: "tanh\u{207B}\u{00B9}",
            textColor: Colors.cyanAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page2Row3 = TableRow(// * : cosec, sec, cot
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 18,
            buttontext: "cosec",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 20,
            buttontext: "sec",
            textColor: Colors.cyanAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            fontSize: 20,
            buttontext: "cot",
            textColor: Colors.cyanAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page2Row4 = TableRow(// * : ln, log, exp
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "ln",
            fontSize: 20,
            textColor: Colors.orangeAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "log",
            fontSize: 20,
            textColor: Colors.orangeAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "exp",
            fontSize: 20,
            textColor: Colors.orangeAccent,
          ),
        ),
        GestureDetector(onTap: () => closeMoreButtons(), child: Container(color: Colors.transparent, height: 64)),
      ]
    );

    TableRow page2Row5 = TableRow(// * : 2^x, x^3, Factorial
      children: [
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "2\u{02E3}",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "x\u{00B3}",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64, color: cellColor,
          child: CustomButtonWithText(
            onTap: (){},
            buttontext: "x!",
            fontSize: 20,
            textColor: Colors.yellowAccent,
          ),
        ),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: cellColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: CustomButtonWithIcon(
            onTap: () => setState(() {
              closeMoreButtons();
              isHyp = false;
              moreButtons = false;
              moreButtonsPage = 1;
            }),
            icon: FontAwesomeIcons.arrowLeft,
            iconColor: Colors.pinkAccent,
            iconSize: 30,
          ),
        ),
      ]
    );

    Table page2table = Table(
      children: [
        page2Row1,
        (isHyp) ? page2Row2IsHyp : page2Row2IsNotHyp,
        page2Row3, page2Row4, page2Row5
      ],
    );

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          setState(() => closeMoreButtons());
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
          )
        ),
        child: (moreButtonsPage == 1) ? page1table : page2table,
      ),
    );
  }
}