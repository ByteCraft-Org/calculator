// ignore_for_file: prefer_const_constructors

import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:calculator/utils/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AreaPage extends StatefulWidget {
  AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final AreaLogics _areaLogics = AreaLogics();

  List<String> unitNameLists = ["Square kilometer", "Hectare", "Are", "Square meter", "Square decimeter", "Square centimeter","Square millimeter","Square micron", "Acre", "Square mile", "Square yard", "Square foot", "Square inch", "Square rod", "Qing", "Mu", "Square chi", "Square cun", "Square kilometer"];

  List<String> unitSymbolLists = ["km2", "ha", "a", "m2", "dm2", "cm2", "mm2", "μm2", "ac", "mile2", "yd2", "ft2", "in2", "rd2", "qing", "mu", "chi2", "cun2", "gongli2"];

  bool isFirstTextSelected = true;
  int firstSelectedItem = 0;
  String firstUnitBtnDD = "km2";
  bool isFirstDDSelected = false;

  int secondSelectedItem = 3;
  String secondUnitBtnDD = "m2";
  bool isSecondDDSelected = false;

  void _onButtonPressed(String btnText, bool firstBox, int firstUnit, int secondUnit){
    setState(() {
      _areaLogics._onButtonPressed(context, btnText, firstBox, firstUnit, secondUnit);
    });
  }

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
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _areaLogics.firstBoxText,
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
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _areaLogics.secondBoxText,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: isFirstTextSelected ? Colors.white : Colors.orange,
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
      setState(() => _areaLogics._convertUnit(isFirstTextSelected, firstSelectedItem, secondSelectedItem));
    });
  }

  Widget _buttonBox(BuildContext context) {
    Wrap col1 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => _onButtonPressed("7", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Four
          onTap: () => _onButtonPressed("4", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : One
          onTap: () => _onButtonPressed("1", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
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
          onTap: () => _onButtonPressed("8", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => _onButtonPressed("5", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => _onButtonPressed("2", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => _onButtonPressed("0", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
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
          onTap: () => _onButtonPressed("9", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => _onButtonPressed("6", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => _onButtonPressed("3", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Decimal
          onTap: () => _onButtonPressed(".", isFirstTextSelected, firstSelectedItem, secondSelectedItem),
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
          onPressed: () => setState(() => _areaLogics._onAllClearPressed()),
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
          onPressed: () => setState(() {
            _areaLogics._onBackSpacePressed(isFirstTextSelected);
            _areaLogics._convertUnit(isFirstTextSelected, firstSelectedItem, secondSelectedItem);
          }),
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

class AreaLogics {
  String firstBoxText = "0";
  String secondBoxText = "0";

  void _onButtonPressed(BuildContext context, String buttonText, bool isFirstBox, int firstUnit, int secondUnit) {
    if (isFirstBox) {
      firstBoxText = _updateText(context, firstBoxText, buttonText);
    } else {
      secondBoxText = _updateText(context, secondBoxText, buttonText);
    }
    _convertUnit(isFirstBox, firstUnit, secondUnit);
  }

  String _updateText(BuildContext context, String currentText, String newText) {
    if(currentText.length == 10) {
      customSnackbar(context: context, message: "Max characters reached");
      return currentText;
    }
    return (currentText == "0") ? newText : currentText + newText;
  }

  void _onAllClearPressed() {
    firstBoxText = "0";
    secondBoxText = "0";
  }

  void _onBackSpacePressed(bool isFirstBox) {
    if (isFirstBox) {
      firstBoxText = _removeLastCharacter(firstBoxText);
    } else {
      secondBoxText = _removeLastCharacter(secondBoxText);
    }
  }

  String _removeLastCharacter(String text) {
    return (text.length > 1) ? text.substring(0, text.length - 1) : "0";
  }
  
  void _convertUnit(bool isFirstBox, int firstUnit, int secondUnit) {
    double inputValue = double.parse(isFirstBox ? firstBoxText : secondBoxText);
    int fromUnit = isFirstBox ? firstUnit : secondUnit;
    int toUnit = isFirstBox ? secondUnit : firstUnit;

    double intermediateValue = 0;

    switch (fromUnit) {
      case 0: intermediateValue = inputValue * 1000000; break;    // Square kilometer to square meter
      case 1: intermediateValue = inputValue * 10000; break;       // Hectare to square meter
      case 2: intermediateValue = inputValue * 100; break;         // Are to square meter
      case 3: intermediateValue = inputValue; break;                // Square Meter (already in square meters)
      case 4: intermediateValue = inputValue * 100; break;         // Square Decimeter to square meter
      case 5: intermediateValue = inputValue * 10000; break;       // Square Centimeter to square meter
      case 6: intermediateValue = inputValue * 1000000; break;     // Square Millimeter to square meter
      case 7: intermediateValue = inputValue * 1000000000000; break;// Square Micron to square meter
      case 8: intermediateValue = inputValue / 4046.856; break;    // Acre to square meter
      case 9: intermediateValue = inputValue / 2589988.110336; break;// Square Mile to square meter
      case 10: intermediateValue = inputValue * 1.19599; break;    // Square Yard to square meter
      case 11: intermediateValue = inputValue * 10.7639; break;    // Square Foot to square meter
      case 12: intermediateValue = inputValue * 1550.0031; break;  // Square Inch to square meter
      case 13: intermediateValue = inputValue / 25.2929; break;    // Square Rod to square meter
      case 14: intermediateValue = inputValue / 150000; break;     // Qing to square meter
      case 15: intermediateValue = inputValue / 666.6666666667; break;// Mu to square meter
      case 16: intermediateValue = inputValue / 0.06; break;      // Square Chi to square meter
      case 17: intermediateValue = inputValue / 0.0006; break;    // Square Cun to square meter
      case 18: intermediateValue = inputValue * 1000000; break;    // Square Kilometer (repeated) to square meter
    }

    double finalValue = 0;

    switch (toUnit) {
      case 0: finalValue = intermediateValue / 1000000; break;    // Square meter to square kilometer
      case 1: finalValue = intermediateValue / 10000; break;       // Square meter to hectare
      case 2: finalValue = intermediateValue / 100; break;         // Square meter to are
      case 3: finalValue = intermediateValue; break;                // Square Meter (already in square meters)
      case 4: finalValue = intermediateValue / 100; break;         // Square meter to square decimeter
      case 5: finalValue = intermediateValue / 10000; break;       // Square meter to square centimeter
      case 6: finalValue = intermediateValue / 1000000; break;     // Square meter to square millimeter
      case 7: finalValue = intermediateValue / 1000000000000; break;// Square meter to square micron
      case 8: finalValue = intermediateValue * 4046.856; break;    // Square meter to acre
      case 9: finalValue = intermediateValue * 2589988.110336; break;// Square meter to square mile
      case 10: finalValue = intermediateValue / 1.19599; break;    // Square meter to square yard
      case 11: finalValue = intermediateValue / 10.7639; break;    // Square meter to square foot
      case 12: finalValue = intermediateValue / 1550.0031; break;  // Square meter to square inch
      case 13: finalValue = intermediateValue * 25.2929; break;    // Square meter to square rod
      case 14: finalValue = intermediateValue * 150000; break;     // Square meter to qing
      case 15: finalValue = intermediateValue * 666.6666666667; break;// Square meter to mu
      case 16: finalValue = intermediateValue * 0.06; break;      // Square meter to square chi
      case 17: finalValue = intermediateValue * 0.0006; break;    // Square meter to square cun
      case 18: finalValue = intermediateValue / 1000000; break;    // Square meter to square kilometer (repeated)
    }

    String resultText = (finalValue == finalValue.toInt()) ? finalValue.toInt().toString() : finalValue.toString();
    if (resultText.length > 12) {
      resultText = double.parse(resultText).toStringAsExponential();
    }

    if (isFirstBox) {
      secondBoxText = resultText;
    } else {
      firstBoxText = resultText;
    }
  }
}
