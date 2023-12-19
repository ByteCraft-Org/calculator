import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonPart extends StatefulWidget {
	final Function(Color) changeAccentColor;
  const ButtonPart({
		super.key,
		required this.changeAccentColor
	});

  @override
  State<ButtonPart> createState() => _ButtonPartState();
}

class _ButtonPartState extends State<ButtonPart> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        runSpacing: 5,
        children: [
          if(isExpanded)
            Row(// * : Ans, log, sin, cos, tan
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWithText(// * : Ans
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "Ans",
                  textColor: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : log
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "lg",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : sin
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "sin",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : cos
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "cos",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : tan
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "tan",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          if(isExpanded)
            Row(// * : Exponent, mod, Open Bracket, Close Bracket, Modulus
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWrap(// * : Exponent
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
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
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "|X|",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : Open Bracket
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "(",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : Close Bracket
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: ")",
                  textColor: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomButtonWithText(// * : Modulus
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "mod",
                  textColor: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          Row(// * : Square Root, Clear, Backspace, Percent, Divide
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
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "C",
                textColor: Theme.of(context).colorScheme.secondary,
                fontSize: isExpanded ? 25 : 30,
                fontWeight: FontWeight.bold,
              ),
              CustomButtonWithIcon(// * : Backspace
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: Icons.backspace,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Percent
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.percent,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Divide
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.divide,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              )
            ],
          ),
          Row(// * : 7, 8, 9, Multiply
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isExpanded)
                CustomButtonWithText(// * : Factorial
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "n!",
                  textColor: Colors.grey,
                  fontSize: 20,
                ),
              CustomButtonWithText(// * : Seven
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "7",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Eight
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "8",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Nine
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "9",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Multiply
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.xmark,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              )
            ],
          ),
          Row(// * : Inverse, 4, 5, 6, Subtract
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isExpanded)
                CustomButtonWithText(// * : Inverse
                  onTap: () {},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "1/x",
                  textColor: Colors.grey,
                  fontSize: 20,
                ),
              CustomButtonWithText(// * : Four
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "4",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Five
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "5",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Six
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "6",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Subtract
                onTap: (){},
                btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.minus,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              )
            ],
          ),
          Row(// * : Pi, 1, 2, 3, Add
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isExpanded)
                CustomButtonWithIcon(// * : Pi
                  onTap: () {},
                  btnSize: isExpanded ? 50 : 65,
                  icon: const IconData(0X03C0, fontFamily: "Arial Bold"),
                  iconColor: Colors.grey
                ),
              CustomButtonWithText(// * : One
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "1",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Two
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "2",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithText(// * : Three
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "3",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Add
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.plus,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              )
            ],
          ),
          Row(// * : Expand, e, 0, Decimal, Equals
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
              if(isExpanded)
                CustomButtonWithText(// * : e
                  onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                  buttontext: "e",
                  textColor: Theme.of(context).primaryColor,
                  fontSize: isExpanded ? 25 : 30,
                ),
              CustomButtonWithText(// * : Zero
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                buttontext: "0",
                textColor: Theme.of(context).primaryColor,
                fontSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Decimal
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: const IconData(46),
                iconColor: Theme.of(context).primaryColor,
                iconSize: isExpanded ? 25 : 30,
              ),
              CustomButtonWithIcon(// * : Equals
                onTap: (){},
                  btnSize: isExpanded ? 50 : 65,
                icon: FontAwesomeIcons.equals,
                iconColor: Theme.of(context).primaryColor,
                bgColor: Theme.of(context).colorScheme.secondary,
                iconSize: isExpanded ? 25 : 30,
              )
            ],
          )
        ]
      ),
    );
  }
}