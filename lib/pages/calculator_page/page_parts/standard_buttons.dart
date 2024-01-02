import 'package:calculator/pages/calculator_page/calculator_logics.dart';
import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StandardButtons extends StatelessWidget {
  final Function(String) onButtonPressed;
  final CalculatorLogics logic;

  const StandardButtons({
    super.key,
    required this.logic,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    TableRow tableRow1 = TableRow(// * : Inverse, Modulus, Clear, Backspace
      children: [
        CustomButtonWithText(// * : Inverse
          onTap: () => onButtonPressed("inverse"),
          buttontext: "1/x",
          textColor: Colors.orange,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Modulus
          onTap: () => onButtonPressed("mod"),
          buttontext: "mod",
          textColor: Colors.orange,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Clear
          onTap: () => onButtonPressed("clear"),
          buttontext: "C",
          textColor: Colors.orange,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Backspace
          onTap: () => onButtonPressed("backspace"),
          icon: Icons.backspace,
          iconColor: Colors.orange,
          iconSize: 30,
        ),
      ],
    );

    TableRow tableRow2 = TableRow(// * : Square, Square Root, Percent, Divide
      children: [
        CustomButtonWithText(// * : Square
          onTap: () => onButtonPressed("square"),
          buttontext: "x²",
          textColor: Colors.orange,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Square Root
          onTap: () => onButtonPressed("squareRoot"),
          icon: FontAwesomeIcons.squareRootVariable,
          iconColor: Colors.orange,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Percent
          onTap: () => onButtonPressed("%"),
          icon: FontAwesomeIcons.percent,
          iconColor: Colors.orange,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Divide
          onTap: () => onButtonPressed("/"),
          icon: FontAwesomeIcons.divide,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow3 = TableRow(// * : 7, 8, 9, Multiply
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => onButtonPressed("7"),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Eight
          onTap: () => onButtonPressed("8"),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Nine
          onTap: () => onButtonPressed("9"),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Multiply
          onTap: () => onButtonPressed("*"),
          icon: FontAwesomeIcons.xmark,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow4 = TableRow(// * : 4, 5, 6, Subtract
      children: [
        CustomButtonWithText(// * : Four
          onTap: () => onButtonPressed("4"),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => onButtonPressed("5"),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => onButtonPressed("6"),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Subtract
          onTap: () => onButtonPressed("-"),
          icon: FontAwesomeIcons.minus,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow5 = TableRow(// * : 1, 2, 3, Add
      children: [
        CustomButtonWithText(// * : One
          onTap: () => onButtonPressed("1"),
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => onButtonPressed("2"),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => onButtonPressed("3"),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Add
          onTap: () => onButtonPressed("+"),
          icon: FontAwesomeIcons.plus,
          iconColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    TableRow tableRow6 = TableRow(// * : PlusMinus, 0, Decimal, Equals
      children: [
        CustomButtonWithIcon(// * : PlusMinus
        onTap: () {},
          icon: FontAwesomeIcons.plusMinus,
          iconColor: Colors.orange,
          iconSize: 25,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => onButtonPressed("0"),
          buttontext: "0",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithIcon(// * : Decimal
          onTap: () => onButtonPressed("."),
          icon: const IconData(46),
          iconColor: Theme.of(context).primaryColor,
          iconSize: 30,
        ),
        CustomButtonWithIcon(// * : Equals
          onTap: () => onButtonPressed("="),
          icon: FontAwesomeIcons.equals,
          iconColor: Theme.of(context).primaryColor,
          bgColor: Colors.orange,
          iconSize: 30,
        )
      ],
    );

    return Table(// * : Standard Calculator
      children: [
        tableRow1, tableRow2, tableRow3, tableRow4, tableRow5, tableRow6
      ],
    );
  }
}