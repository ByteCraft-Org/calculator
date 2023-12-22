import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonPart extends StatefulWidget {
  const ButtonPart({super.key});

  @override
  State<ButtonPart> createState() => _ButtonPartState();
}

class _ButtonPartState extends State<ButtonPart> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    Row row1 = Row(// * : Exponent, mod, Open Bracket, Close Bracket, Modulus
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWrap(// * : Exponent
          onTap: (){},
          
          childern1: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "X",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          childern2: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "y",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          childern3: Container(),
        ),
        CustomButtonWithText(// * : mod
          onTap: (){},
          
          buttontext: "|X|",
          textColor: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Open Bracket
          onTap: (){},
          
          buttontext: "(",
          textColor: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Close Bracket
          onTap: (){},
          
          buttontext: ")",
          textColor: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithText(// * : Modulus
          onTap: (){},
          
          buttontext: "mod",
          textColor: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
    
    Row row2 = Row(// * : Square Root, Clear, Backspace, Percent, Divide
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isExpanded)
          SvgButton(// * : Square Root
            onTap: () {},
            assetPath: "assets/svg/squareRoot.svg",
            height: 22,
          ),
        CustomButtonWithText(// * : Clear
          onTap: (){},
            
          buttontext: "C",
          textColor: Theme.of(context).colorScheme.secondary,
          fontSize: isExpanded ? 25 : 30,
          fontWeight: FontWeight.bold,
        ),
        CustomButtonWithIcon(// * : Backspace
          onTap: (){},
            
          icon: Icons.backspace,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithIcon(// * : Percent
          onTap: (){},
            
          icon: FontAwesomeIcons.percent,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithIcon(// * : Divide
          onTap: (){},
            
          icon: FontAwesomeIcons.divide,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        )
      ],
    );

    Row row3 = Row(// * : Factorial, 7, 8, 9, Multiply
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isExpanded)
          CustomButtonWithText(// * : Factorial
            onTap: (){},
            buttontext: "n!",
            textColor: Colors.grey,
            fontSize: 20,
          ),
        CustomButtonWithText(// * : Seven
          onTap: (){},
            
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Eight
          onTap: (){},
            
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Nine
          onTap: (){},
            
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithIcon(// * : Multiply
          onTap: (){},
            
          icon: FontAwesomeIcons.xmark,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        )
      ],
    );

    Row row4 = Row(// * : Inverse, 4, 5, 6, Subtract
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isExpanded)
          CustomButtonWithText(// * : Inverse
            onTap: () {},
            buttontext: "1/x",
            textColor: Colors.grey,
            fontSize: 15,
          ),
        CustomButtonWithText(// * : Four
          onTap: (){},
            
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: (){},
            
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: (){},
            
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithIcon(// * : Subtract
          onTap: (){},
          
          icon: FontAwesomeIcons.minus,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        )
      ],
    );

    Row row5 = Row(// * : Pi, 1, 2, 3, Add
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isExpanded)
          CustomButtonWithIcon(// * : Pi
            onTap: () {},
            
            icon: const IconData(0X03C0, fontFamily: "Arial Bold"),
            iconColor: Colors.grey
          ),
        CustomButtonWithText(// * : One
          onTap: (){},
            
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: (){},
            
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: (){},
            
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithIcon(// * : Add
          onTap: (){},
            
          icon: FontAwesomeIcons.plus,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        )
      ],
    );

    Row row6 = Row(// * : Expand, e, 0, Decimal, Equals
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWithIcon(// * : Expand
        onTap: () {
          setState(() => isExpanded = !isExpanded);
        },
          icon: isExpanded ? FontAwesomeIcons.minimize : FontAwesomeIcons.maximize,
          iconColor: Theme.of(context).colorScheme.secondary,
          iconSize: 25,
        ),
        CustomButtonWithIcon(// * : Decimal
          onTap: (){},
            
          icon: const IconData(46),
          iconColor: Theme.of(context).primaryColor,
          iconSize: isExpanded ? 25 : 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: (){},
            
          buttontext: "0",
          textColor: Theme.of(context).primaryColor,
          fontSize: isExpanded ? 25 : 30,
        ),
        if(isExpanded)
          CustomButtonWithText(// * : Ans
            onTap: (){},
            buttontext: "Ans",
            textColor: Theme.of(context).colorScheme.secondary,
            fontSize: isExpanded ? 20 : 30,
          ),
        CustomButtonWithIcon(// * : Equals
          onTap: (){},
            
          icon: FontAwesomeIcons.equals,
          iconColor: Theme.of(context).primaryColor,
          bgColor: Theme.of(context).colorScheme.secondary,
          iconSize: isExpanded ? 25 : 30,
        )
      ],
    );

    return Wrap(
      runSpacing: 5,
      children: [
        if(isExpanded)
          row1,
        row2,
        row3,
        row4,
        row5,
        row6
      ]
    );
  }
}