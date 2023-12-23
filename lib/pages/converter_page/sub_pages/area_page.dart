// ignore_for_file: prefer_const_constructors

import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AreaPage extends StatefulWidget {
  AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  List<String> unitNameLists = ["Square kilometer", "Hectare", "Are", "Square meter", "Square decimeter", "Square centimeter","Square millimeter","Square micron", "Acre", "Square mile", "Square yard", "Square foot", "Square inch", "Square rod", "Qing", "Mu", "Square chi", "Square cun", "Square kilometer"];

  List<String> unitSymbolLists = ["km2", "ha", "a", "m2", "dm2", "cm2", "mm2", "μm2", "ac", "mile2", "yd2", "ft2", "in2", "rd2", "qing", "mu", "chi2", "cun2", "gongli2"];

  bool isFirstTextSelected = true;
  int firstSelectedItem = 0;
  String firstUnitBtnDD = "km2";
  bool isFirstDDSelected = false;

  bool isSecondTextSelected = false;
  int secondSelectedItem = 3;
  String secondUnitBtnDD = "m2";
  bool isSecondDDSelected = false;

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(// * : First Unit box
              flex: 2,
              child: _firstUnitBox(context),
            ),
            Expanded(
              flex: 1,
              child: Divider(color: Colors.grey.withOpacity(0.5),)
            ),
            Expanded(// * : Second Unit box
              flex: 2,
              child: _secondUnitBox(context),
            ),
            const SizedBox(height: 5,),
            Divider(// * : Divider Line
            thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            const SizedBox(height: 5,),
            Align(// * : Button Segment
              alignment: Alignment.bottomCenter,
              child: _buttonBox(context)
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstUnitBox(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(// * : First Unit Selector
          onTap: () {
            setState(() => isFirstDDSelected = true);
            _showBottomDialog(context, btn: 1);
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: firstUnitBtnDD.endsWith("2")
                  ? firstUnitBtnDD.substring(0, firstUnitBtnDD.length - 1)
                  : firstUnitBtnDD,
                  style: TextStyle(
                    color: isFirstDDSelected ? Colors.orange : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if(firstUnitBtnDD.endsWith("2"))
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(0, -3),
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: isFirstDDSelected ? Colors.orange : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    ),
                  ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: isFirstDDSelected ? Colors.orange : Colors.white,
                  )
                )
              ],
            ),
          ),
        ),
        Expanded(// * : First Unit Text Box
          child: GestureDetector(
            onTap: () {
              setState(() => isFirstTextSelected = true);
              setState(() => isSecondTextSelected = false);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "12345",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: isFirstTextSelected ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                  Container(// * : Unit Display
                    alignment: Alignment.centerRight,
                    child: Text(
                      unitNameLists[firstSelectedItem],
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

  Widget _secondUnitBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(// * : First Unit Selector
            onTap: () {
              setState(() => isSecondDDSelected = true);
              _showBottomDialog(context, btn: 2);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: secondUnitBtnDD.endsWith("2")
                    ? secondUnitBtnDD.substring(0, secondUnitBtnDD.length - 1)
                    : secondUnitBtnDD,
                    style: TextStyle(
                      color: isSecondDDSelected ? Colors.orange : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  if(secondUnitBtnDD.endsWith("2"))
                    WidgetSpan(
                      child: Transform.translate(
                        offset: Offset(0, -3),
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: isSecondDDSelected ? Colors.orange : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                    ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: isSecondDDSelected ? Colors.orange : Colors.white,
                    )
                  )
                ],
              ),
            ),
          ),
          Expanded(// * : Second Unit Text Box
            child: GestureDetector(
              onTap: () {
                setState(() => isFirstTextSelected = false);
                setState(() => isSecondTextSelected = true);
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "12345",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: isSecondTextSelected ? Colors.orange : Colors.white,
                        ),
                      ),
                    ),
                    Container(// * : Unit Display
                      alignment: Alignment.centerRight,
                      child: Text(
                        unitNameLists[secondSelectedItem],
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

  void _showBottomDialog(BuildContext context , {required int btn}) {
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
              Container(// * : Bottom Sheet Heading
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Select unit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(// * : Unit Container
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0; index < unitNameLists.length - 1; index++)
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: unitNameLists[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 10,)),
                                TextSpan(
                                  text: unitSymbolLists[index].endsWith("2")
                                  ? unitSymbolLists[index].substring(0, unitSymbolLists[index].length - 1)
                                  : unitSymbolLists[index],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                if(unitSymbolLists[index].endsWith("2"))
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: Offset(0, -3),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          textBaseline: TextBaseline.alphabetic,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if(btn == 1) {
                                firstSelectedItem = index;
                                firstUnitBtnDD = unitSymbolLists[index];
                                isFirstDDSelected = false;
                              } else {
                                secondSelectedItem = index;
                                secondUnitBtnDD = unitSymbolLists[index];
                                isSecondDDSelected = false;
                              }
                            });
                            Navigator.pop(context);
                          },
                        ),
                    ],
                  ),
                ),
              ),
              Padding(// * : Cancel button
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFirstDDSelected = false;
                        isSecondDDSelected = false;
                      });
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey[800]),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.all(12)
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      )
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
        isFirstDDSelected = false;
        isSecondDDSelected = false;
      });
    });
  }

  Widget _buttonBox(BuildContext context) {
    Wrap col1 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(// * : Seven
          onTap: (){},
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Four
          onTap: (){},
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : One
          onTap: (){},
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
        CustomButtonWithText(// * : Eight
          onTap: (){},
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: (){},
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: (){},
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: (){},
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
        CustomButtonWithText(// * : Nine
          onTap: (){},
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: (){},
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: (){},
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Decimal
          onTap: (){},
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
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(60,140)
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
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(40,140)
            )
          ),
          child: Icon(
            LineAwesomeIcons.backspace,
            color: Colors.orange,
            size: 35,
          ),
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
}
