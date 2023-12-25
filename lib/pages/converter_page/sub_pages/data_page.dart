import 'dart:math';

import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:calculator/utils/widgets/custom_snackbar.dart';
import 'package:calculator/utils/widgets/custom_unitboxes.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final DataLogics _dataLogics = DataLogics();

  List<String> unitNameLists = ["Bit", "Byte", "Kilobyte", "Megabyte", "Gigabyte", "Terabyte", "Petabyte"];

  List<String> unitSymbolLists = ['b', 'B', 'KB', 'MB', 'GB', 'TB', 'PB'];

  bool isFirstBoxSelected = true;
  int firstSelectedItem = 2;
  late String firstUnitBtnDD;
  bool isFirstDDSelected = false;

  int secondSelectedItem = 3;
  late String secondUnitBtnDD;
  bool isSecondDDSelected = false;

  @override
  void initState() {
    firstUnitBtnDD = unitSymbolLists[firstSelectedItem];
    secondUnitBtnDD = unitSymbolLists[secondSelectedItem];
    super.initState();
  }

  void _onButtonPressed(String btnText, bool firstBox, int firstUnit, int secondUnit){
    setState(() {
      _dataLogics._onButtonPressed(context, btnText, firstBox, firstUnit, secondUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Data"),
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

  CustomUnitBoxes _firstUnitBox(BuildContext context) {
    return CustomUnitBoxes(
      onTapDropDown: () {
        setState(() => isFirstDDSelected = true);
        _showBottomDialog(context, btn: 1);
      },
      dropDownDisplay: Row(
        children: [
          Text(
            firstUnitBtnDD,
            style: TextStyle(
              color: isFirstDDSelected ? Colors.orange : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: isFirstDDSelected ? Colors.orange : Colors.white,
          )
        ],
      ),
      onTapBox: () {
        setState(() => isFirstBoxSelected = true);
      },
      valueText: (_dataLogics.firstExponent.isEmpty)
      ? Text(
        _dataLogics.firstBoxText,
        maxLines: 1,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: isFirstBoxSelected ? Colors.orange : Colors.white,
        ),
      )
      : RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: _dataLogics.firstBoxText,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: isFirstBoxSelected ? Colors.orange : Colors.white,
              ),
            ),
            TextSpan(
              text: "×",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
              ),
            ),
            TextSpan(
              text: "10",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
              ),
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0, -3),
                child: Text(
                  _dataLogics.firstExponent,
                  style: TextStyle(
                    color: isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
      isThisBoxSelected: isFirstBoxSelected,
      unitLists: unitNameLists,
      selectedItem: firstSelectedItem,
    );
  }

  CustomUnitBoxes _secondUnitBox(BuildContext context) {
    return CustomUnitBoxes(
      onTapDropDown: () {
        setState(() => isSecondDDSelected = true);
        _showBottomDialog(context, btn: 2);
      },
      dropDownDisplay: Row(
        children: [
          Text(
            secondUnitBtnDD,
            style: TextStyle(
              color: isSecondDDSelected ? Colors.orange : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: isSecondDDSelected ? Colors.orange : Colors.white,
          )
        ],
      ),
      onTapBox: () {
        setState(() => isFirstBoxSelected = false);
      },
      valueText: (_dataLogics.secondExponent.isEmpty)
      ? Text(
        _dataLogics.secondBoxText,
        maxLines: 1,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: !isFirstBoxSelected ? Colors.orange : Colors.white,
        ),
      )
      : RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: _dataLogics.secondBoxText,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: !isFirstBoxSelected ? Colors.orange : Colors.white,
              ),
            ),
            TextSpan(
              text: "×",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: !isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
              ),
            ),
            TextSpan(
              text: "10",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: !isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
              ),
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0, -3),
                child: Text(
                  _dataLogics.secondExponent,
                  style: TextStyle(
                    color: !isFirstBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
      isThisBoxSelected: !isFirstBoxSelected,
      unitLists: unitNameLists,
      selectedItem: secondSelectedItem,
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Container(// * : Bottom Sheet Heading
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Select unit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(// * : Unit Container
                height: 300,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0; index < unitNameLists.length; index++)
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: unitNameLists[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const WidgetSpan(child: SizedBox(width: 10,)),
                                TextSpan(
                                  text: unitSymbolLists[index].endsWith("2")
                                  ? unitSymbolLists[index].substring(0, unitSymbolLists[index].length - 1)
                                  : unitSymbolLists[index],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                if(unitSymbolLists[index].endsWith("2"))
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, -3),
                                      child: const Text(
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.all(12)
                      ),
                    ),
                    child: const Text(
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
      setState(() => _dataLogics._convertUnit(isFirstBoxSelected, firstSelectedItem, secondSelectedItem));
    });
  }

  Widget _buttonBox(BuildContext context) {
    Wrap col1 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => _onButtonPressed("7", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Four
          onTap: () => _onButtonPressed("4", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : One
          onTap: () => _onButtonPressed("1", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        const SizedBox(
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
          onTap: () => _onButtonPressed("8", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => _onButtonPressed("5", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => _onButtonPressed("2", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => _onButtonPressed("0", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
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
          onTap: () => _onButtonPressed("9", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => _onButtonPressed("6", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => _onButtonPressed("3", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Decimal
          onTap: () => _onButtonPressed(".", isFirstBoxSelected, firstSelectedItem, secondSelectedItem),
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
          onPressed: () => setState(() => _dataLogics._onAllClearPressed()),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(60,140)
            )
          ),
          child: const Text(
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
            _dataLogics._onBackSpacePressed(isFirstBoxSelected);
            _dataLogics._convertUnit(isFirstBoxSelected, firstSelectedItem, secondSelectedItem);
          }),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(40,140)
            )
          ),
          child: const Icon(
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

class DataLogics {
  String firstBoxText = "0";
  String secondBoxText = "0";
  String firstExponent = "";
  String secondExponent = "";

  void _onButtonPressed(BuildContext context, String buttonText, bool isFirstBox, int firstUnit, int secondUnit) {
    if (isFirstBox) {
      firstBoxText = _updateText(context, firstBoxText, buttonText);
    } else {
      secondBoxText = _updateText(context, secondBoxText, buttonText);
    }
    _convertUnit(isFirstBox, firstUnit, secondUnit);
  }

  String _updateText(BuildContext context, String currentText, String newText) {
    if(currentText.length == 6) {
      customSnackbar(context: context, message: "Max characters reached");
      return currentText;
    }
    return (currentText == "0") ? newText : currentText + newText;
  }

  void _onAllClearPressed() {
    firstBoxText = "0";
    secondBoxText = "0";
    firstExponent = "";
    secondExponent = "";
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

    // Convert to Gigabytes
    double intermediateValue = inputValue;

    switch (fromUnit) {
      case 0: intermediateValue /= 8 * 1024 * 1024 * 1024; break;       // Bit to Gigabyte
      case 1: intermediateValue /= 1024 * 1024 * 1024; break;           // Byte to Gigabyte
      case 2: intermediateValue /= 1024 * 1024; break;                          // Kilobyte to Gigabyte
      case 3: intermediateValue /= 1024; break;                             // Megabyte to Gigabyte
      case 4: intermediateValue *= 1; break;                          // Gigabyte to Gigabyte
      case 5: intermediateValue *= 1024; break;                   // Terabyte to Gigabyte
      case 6: intermediateValue *= 1024 * 1024; break;            // Petabyte to Gigabyte
    }

    // Convert from Gigabytes to the target unit
    double finalValue = 0;

    switch (toUnit) {
      case 0: finalValue = intermediateValue * 8 * 1024 * 1024 * 1024; break;       // Gigabyte to Bit
      case 1: finalValue = intermediateValue * 1024 * 1024 * 1024; break;           // Gigabyte to Byte
      case 2: finalValue = intermediateValue * 1024 * 1024; break;                          // Gigabyte to Kilobyte
      case 3: finalValue = intermediateValue * 1024; break;                             // Gigabyte to Megabyte
      case 4: finalValue = intermediateValue / 1; break;                          // Gigabyte to Gigabyte
      case 5: finalValue = intermediateValue / 1024; break;                  // Gigabyte to Terabyte
      case 6: finalValue = intermediateValue / (1024 * 1024); break;         // Gigabyte to Petabyte
    }

    finalValue = (finalValue == finalValue.toInt()) ? double.parse(finalValue.toInt().toString()) : finalValue;
    String resultText = formatScientificNotation(finalValue, isFirstBox);

    if (isFirstBox) {
      secondBoxText = resultText;
    } else {
      firstBoxText = resultText;
    }
  }

  String formatScientificNotation(double value, bool isFirstBox) {
    String resultText = value.toString();
    
    if (resultText.length > 8) {
      double coefficient = value / pow(10, (log(value.abs()) / ln10).floor());
      int exp = (log(value.abs()) / ln10).floor();
      resultText = coefficient.toStringAsFixed(8);
      
      if (isFirstBox) {
        secondExponent = exp.toString();
      } else {
        firstExponent = exp.toString();
      }
    }

    return resultText;
  }
}
