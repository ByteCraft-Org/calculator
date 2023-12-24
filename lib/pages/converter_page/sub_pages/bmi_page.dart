// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BmiPage extends StatefulWidget {
  BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  List<String> weightLists = ["Kilograms", "Pounds"];
  List<String> heightLists = ["Centimeters", "Meters", "Feet", "Inches"];

  bool isWeightTextSelected = true;
  int weightItem = 0;
  String weightUnitBtnDD = "Kilograms";
  bool isWeightDDSelected = false;

  int heightItem = 1;
  String heightUnitBtnDD = "Meters";
  bool isheightDDSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Area"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: _weightUnitBox(context),
            ),
            Expanded(
              flex: 1,
              child: Divider(color: Colors.grey.withOpacity(0.5)),
            ),
            Expanded(
              flex: 2,
              child: _heightUnitBox(context),
            ),
            SizedBox(height: 5,),
            Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buttonBox(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weightUnitBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => isWeightDDSelected = true);
            _showBottomDialog(context, items: weightLists);
          },
          child: Row(
            children: [
              Text(
                "Weight",
                style: TextStyle(
                  color: isWeightDDSelected ? Colors.orange : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: isWeightDDSelected ? Colors.orange : Colors.white,
              )
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => isWeightTextSelected = true);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "0",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: isWeightTextSelected ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      weightLists[weightItem],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _heightUnitBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => isheightDDSelected = true);
            _showBottomDialog(context, items: heightLists);
          },
          child: Row(
            children: [
              Text(
                "Height",
                style: TextStyle(
                  color: isheightDDSelected ? Colors.orange : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: isheightDDSelected ? Colors.orange : Colors.white,
              )
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => isWeightTextSelected = false);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "0",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: isWeightTextSelected ? Colors.white : Colors.orange,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      heightLists[heightItem],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showBottomDialog(BuildContext context, {required List<String> items}) {
    showModalBottomSheet(
      backgroundColor: Colors.grey[900],
      elevation: 1,
      useSafeArea: false,
      context: context,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Select unit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int index = 0; index < items.length; index++)
                            ListTile(
                              title: Text(
                                items[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  if (items == weightLists) {
                                    weightItem = index;
                                    weightUnitBtnDD = items[index];
                                    isWeightDDSelected = false;
                                  } else {
                                    heightItem = index;
                                    heightUnitBtnDD = items[index];
                                    isheightDDSelected = false;
                                  }
                                });
                                Navigator.pop(context);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isWeightDDSelected = false;
                        isheightDDSelected = false;
                      });
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey[800]),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.all(12),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ).then((value) {
      setState(() {
        isWeightDDSelected = false;
        isheightDDSelected = false;
      });
    });
  }

  Widget _buttonBox(BuildContext context) {
    Wrap col1 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(
          onTap: () => _onButtonPressed("7", isWeightTextSelected),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("4", isWeightTextSelected),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("1", isWeightTextSelected),
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        SizedBox(
          width: 60,
          height: 60,
        )
      ],
    );

    Wrap col2 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(
          onTap: () => _onButtonPressed("8", isWeightTextSelected),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("5", isWeightTextSelected),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("2", isWeightTextSelected),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("0", isWeightTextSelected),
          buttontext: "0",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
      ],
    );

    Wrap col3 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(
          onTap: () => _onButtonPressed("9", isWeightTextSelected),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("6", isWeightTextSelected),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed("3", isWeightTextSelected),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(
          onTap: () => _onButtonPressed(".", isWeightTextSelected),
          buttontext: ".",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
      ],
    );

    Wrap col4 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _onAllClearPressed()),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              CircleBorder()
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(90,100)
            )
          ),
          child: Text(
            "AC",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        ElevatedButton(
          onPressed: () => setState(() => _onBackSpacePressed()),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              CircleBorder()
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(90,100)
            )
          ),
          child: Icon(
            LineAwesomeIcons.backspace,
            color: Colors.orange,
            size: 35,
          ),
        ),
        ElevatedButton(
          onPressed: () => setState(() => _onAllClearPressed()),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              CircleBorder()
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(90,100)
            )
          ),
          child: Text(
            "GO",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        col1,
        col2,
        col3,
        col4
      ],
    );
  }

  void _onButtonPressed(String buttonText, bool isWeight) {
    // Add your logic here for button press
  }

  void _onAllClearPressed() {
    // Add your logic here for all clear button press
  }

  void _onBackSpacePressed() {
    // Add your logic here for backspace button press
  }
}
