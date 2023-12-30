import 'dart:math';

import 'package:calculator/properties/acceleration.dart';
import 'package:calculator/properties/angle.dart';
import 'package:calculator/properties/area.dart';
import 'package:calculator/properties/converter.dart';
import 'package:calculator/properties/density.dart';
import 'package:calculator/properties/digital_data.dart';
import 'package:calculator/properties/electric_charge.dart';
import 'package:calculator/properties/energy.dart';
import 'package:calculator/properties/force.dart';
import 'package:calculator/properties/frequency.dart';
import 'package:calculator/properties/fuel_consumption.dart';
import 'package:calculator/properties/illuminance.dart';
import 'package:calculator/properties/length.dart';
import 'package:calculator/properties/mass.dart';
import 'package:calculator/properties/molar_mass.dart';
import 'package:calculator/properties/molar_volume.dart';
import 'package:calculator/properties/power.dart';
import 'package:calculator/properties/pressure.dart';
import 'package:calculator/properties/speed.dart';
import 'package:calculator/properties/temprature.dart';
import 'package:calculator/properties/time.dart';
import 'package:calculator/properties/torque.dart';
import 'package:calculator/properties/volume.dart';
import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:calculator/utils/widgets/custom_snackbar.dart';
import 'package:calculator/utils/widgets/custom_unitboxes.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ImplementationPage extends StatefulWidget {
  final  String unitType;
  final List<String> unitNameLists;
  final List<String> unitSymbolLists;
  const ImplementationPage({
    super.key,
    required this.unitType,
    required this.unitNameLists,
    required this.unitSymbolLists,
  });

  @override
  State<ImplementationPage> createState() => _ImplementationPageState();
}

class _ImplementationPageState extends State<ImplementationPage> {
  late final ConverterLogics _logics;

  bool isFirstBoxSelected = true;
  int firstSelectedItem = 0;
  late String firstUnitBtnDD;
  bool isFirstDDSelected = false;

  int secondSelectedItem = 1;
  late String secondUnitBtnDD;
  bool isSecondDDSelected = false;

  @override
  void initState() {
    _logics = ConverterLogics(widget.unitType);

    firstUnitBtnDD = widget.unitSymbolLists[firstSelectedItem];
    secondUnitBtnDD = widget.unitSymbolLists[secondSelectedItem];
    super.initState();
  }

  void _onButtonPressed(String btnText, bool firstBox, int firstUnit, int secondUnit){
    setState(() {
      _logics._onButtonPressed(context, btnText, firstBox, firstUnit, secondUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(widget.unitType),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(// * : First Unit box
            height: 120,
              child: _firstUnitBox(context),
            ),
            const SizedBox(height: 50),
            SizedBox(// * : Second Unit box
              height: 120,
              child: _secondUnitBox(context),
            ),
            const SizedBox(height: 5,),
            Divider(// * : Divider Line
            thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            const SizedBox(height: 5,),
            Expanded(// * : Button Segment
              child: _buttonBox(context),
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
      dropDownText: firstUnitBtnDD,
      isThisDDSelected: isFirstDDSelected,
      onTapBox: () {
        setState(() {
          isFirstBoxSelected = true;
          _logics.firstBoxText = "0";
          _logics.firstExponent = "";
        });
      },
      valueText: _logics.firstBoxText,
      exponent: _logics.firstExponent,
      isThisBoxSelected: isFirstBoxSelected,
      unitLists: widget.unitNameLists,
      selectedItem: firstSelectedItem,
    );
  }

  CustomUnitBoxes _secondUnitBox(BuildContext context) {
    return CustomUnitBoxes(
      onTapDropDown: () {
        setState(() => isSecondDDSelected = true);
        _showBottomDialog(context, btn: 2);
      },
      dropDownText: secondUnitBtnDD,
      isThisDDSelected: isSecondDDSelected,
      onTapBox: () {
        setState(() {
          isFirstBoxSelected = false;
          _logics.secondBoxText = "0";
          _logics.secondExponent = "";
        });
      },
      valueText: _logics.secondBoxText,
      exponent: _logics.secondExponent,
      isThisBoxSelected: !isFirstBoxSelected,
      unitLists: widget.unitNameLists,
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
                  "Select Unit",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(// * : Unit Container
                constraints: const BoxConstraints(
                  maxHeight: 300
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      for (int index = 0; index < widget.unitNameLists.length; index++)
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.unitNameLists[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                TextSpan(
                                  text: " : ${widget.unitSymbolLists[index]}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if(btn == 1) {
                                firstSelectedItem = index;
                                firstUnitBtnDD = widget.unitSymbolLists[index];
                                isFirstDDSelected = false;
                              } else {
                                secondSelectedItem = index;
                                secondUnitBtnDD = widget.unitSymbolLists[index];
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
      setState(() => _logics._convertUnit(isFirstBoxSelected, firstSelectedItem, secondSelectedItem));
    });
  }

  Widget _buttonBox(BuildContext context) {
    Column col1 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
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

    Column col2 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
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

    Column col3 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
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

    Column col4 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomConverterButton(
          onPressed: () => setState(() => _logics._onAllClearPressed()),
          text: "AC",
        ),
        CustomConverterButton(
          onPressed: () => setState(() => _logics._onBackSpacePressed(isFirstBoxSelected, firstSelectedItem, secondSelectedItem)),
          icon: LineAwesomeIcons.backspace,
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

class ConverterLogics {
  String firstBoxText = "0";
  String firstExponent = "";
  String secondBoxText = "0";
  String secondExponent = "";

  String unitType = "";

  ConverterLogics(String unit){
    unitType = unit;
  }

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
    return (currentText == "0") ? (newText == ".") ? "0$newText" : newText : currentText + newText;
  }

  void _onAllClearPressed() {
    firstBoxText = "0";
    secondBoxText = "0";
    firstExponent = "";
    secondExponent = "";
  }

  void _onBackSpacePressed(bool isFirstBox, int firstUnit, int secondUnit) {
    if (isFirstBox) {
      firstBoxText = _removeLastCharacter(firstBoxText);
    } else {
      secondBoxText = _removeLastCharacter(secondBoxText);
    }
    _convertUnit(isFirstBox, firstUnit, secondUnit);
  }

  String _removeLastCharacter(String text) {
    return (text.length > 1) ? text.substring(0, text.length - 1) : "0";
  }
  
  void _convertUnit(bool isFirstBox, int firstUnit, int secondUnit) {
    double inputValue = double.parse(isFirstBox ? firstBoxText : secondBoxText);
    int fromUnit = isFirstBox ? firstUnit : secondUnit;
    int toUnit = isFirstBox ? secondUnit : firstUnit;

    double result = _getConverter(unitType).convert(inputValue, fromUnit, toUnit);

    String resultText = formatScientificNotation(isFirstBox, result);

    if (isFirstBox) {
      secondBoxText = resultText;
    } else {
      firstBoxText = resultText;
    }
  }


  String formatScientificNotation(bool isFirstBox, double value) {
    String resultText = value.toString();
    int exp = 0;
    if (value == value.floor()) {
      // If the value is an integer, convert it to an integer string
      resultText = value.floor().toString();
    } else {
      if (resultText.length > 8) {
        double coefficient = value / pow(10, (log(value.abs()) / ln10).floor());
        exp = (log(value.abs()) / ln10).floor();
        resultText = coefficient.toStringAsFixed(8);

        // Remove unnecessary trailing zeros after the decimal point
        resultText = resultText.replaceAllMapped(
          RegExp(r"(\.\d*?[1-9])0*?$"),
          (match) => match.group(1)!,
        );
      }
    }

    if (isFirstBox) {
      secondExponent = exp.toString();
    } else {
      firstExponent = exp.toString();
    }

    return resultText;
  }

  Converter<int> _getConverter(String unitType) {
    print('Unit type: $unitType');
    switch (unitType) {
      case 'Acceleration' : return AccelerationConverter();
      case 'Angle' : return AngleConverter();
      case 'Area' : return AreaConverter();
      case 'Density' : return DensityConverter();
      case 'Digital Data' : return DigitalDataConverter();
      case 'Electric Charge' : return ElectricChargeConverter();
      case 'Energy' : return EnergyConverter();
      case 'Force' : return ForceConverter();
      case 'Frequency' : return FrequencyConverter();
      case 'Fuel Consumption' : return FuelConsumptionConverter();
      case 'Illuminance' : return IlluminanceConverter();
      case 'Length': return LengthConverter();
      case 'Mass' : return MassConverter();
      case 'Molar Mass' : return MolarMassConverter();
      case 'Molar Volume' : return MolarVolumeConverter();
      case 'Power' : return PowerConverter();
      case 'Pressure' : return PressureConverter();
      case 'Speed' : return SpeedConverter();
      case 'Temprature' : return TemperatureConverter();
      case 'Time' : return TimeConverter();
      case 'Torque' : return TorqueConverter();
      case 'Volume' : return VolumeConverter();

      default:
        throw Exception('Unsupported unit type: $unitType');
    }
  }
}
