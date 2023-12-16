import 'package:calculator/utils/values/colors.dart';
import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonPart extends StatefulWidget {
  const ButtonPart({super.key});

  @override
  State<ButtonPart> createState() => _ButtonPartState();
}

class _ButtonPartState extends State<ButtonPart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 5,
        children: [
          Row(// * : Clear, Backspace, Modulus, Divide
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWithText(
                onTap: (){},
                buttontext: "C",
                textColor: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: Icons.backspace,
                iconColor: Theme.of(context).colorScheme.secondary,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.percent,
                iconColor: Theme.of(context).colorScheme.secondary,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.divide,
                iconColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          Row(// * : 7, 8, 9, Multiply
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWithText(
                onTap: (){},
                buttontext: "7",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "8",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "9",
                textColor: primaryColor,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.xmark,
                iconColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          Row(// * : 4, 5, 6, Subtract
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWithText(
                onTap: (){},
                buttontext: "4",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "5",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "6",
                textColor: primaryColor,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.minus,
                iconColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          Row(// * : 1, 2, 3, Add
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWithText(
                onTap: (){},
                buttontext: "1",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "2",
                textColor: primaryColor,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "3",
                textColor: primaryColor,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.plus,
                iconColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          Row(// * : Color Palette, 0, Decimal, Equals
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWithIcon(
                onTap: (){},
                icon: Icons.color_lens,
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: 25,
              ),
              CustomButtonWithText(
                onTap: (){},
                buttontext: "0",
                textColor: primaryColor,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: const IconData(46),
                iconColor: Theme.of(context).colorScheme.secondary,
                iconSize: 30,
              ),
              CustomButtonWithIcon(
                onTap: (){},
                icon: FontAwesomeIcons.equals,
                iconColor: primaryColor,
                bgColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          )
        ]
      ),
    );
  }
}
