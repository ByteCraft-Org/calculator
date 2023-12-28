import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:calculator/utils/widgets/custom_snackbar.dart';
import 'package:calculator/utils/widgets/custom_unitboxes.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final BmiLogics _bmiLogics = BmiLogics();

  List<String> weightLists = ["Kilograms", "Pounds"];

  List<String> heightLists = ["Centimeters", "Meters", "Feet", "Inches"];

  bool showBMI = false;

  bool isWeightTextSelected = true;
  int weightItem = 0;
  String weightUnitBtnDD = "Kilograms";
  bool isWeightDDSelected = false;

  int heightItem = 1;
  String heightUnitBtnDD = "Meters";
  bool isheightDDSelected = false;

  void _onButtonPressed(String btnText, bool isWeight, int weightUnit, int height){
    setState(() {
      _bmiLogics._onButtonPressed(context, btnText, isWeight);
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
        title: const Text("BMI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(// * : Weight Unit box
              flex: 2, child: _weightUnitBox(context),
            ),
            Expanded(
              flex: 1, child: Divider(color: Colors.grey.withOpacity(0.5),)
            ),
            Expanded(// * : Height Unit box
              flex: 2, child: _heightUnitBox(context),
            ),
            const SizedBox(height: 5,),
            Divider(// * : Divider Line
              thickness: 2, color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            const SizedBox(height: 5,),
            (!showBMI)
            ? Align(// * : Button Segment
              alignment: Alignment.bottomCenter, child: _buttonBox(context),
            )
            : Expanded(
              flex: 8, child: _bmiBox()
            )
          ],
        ),
      ),
    );
  }

  CustomUnitBoxes _weightUnitBox(BuildContext context) {
    return CustomUnitBoxes(
      onTapDropDown: () {
        setState(() {
          isWeightDDSelected = true;
          isWeightTextSelected = true;
          showBMI = false;
        });
        _showBottomDialog(context, items: weightLists);
      },
      dropDownText: "Weight",
      isThisDDSelected: isWeightDDSelected,
      onTapBox: () {
        setState(() {
          isWeightTextSelected = true;
          showBMI = false;
        });
      },
      valueText: _bmiLogics.weight,
      isThisBoxSelected: isWeightTextSelected,
      unitLists: weightLists,
      selectedItem: weightItem,
    );
  }

  CustomUnitBoxes _heightUnitBox(BuildContext context) {
    return CustomUnitBoxes(
      onTapDropDown: () {
        setState(() {
          isheightDDSelected = true;
          isWeightTextSelected = false;
          showBMI = false;
        });
        _showBottomDialog(context, items: heightLists);
      },
      dropDownText: "Height",
      isThisDDSelected: isheightDDSelected,
      onTapBox: () {
        setState(() {
          isWeightTextSelected = false;
          showBMI = false;
        });
      },
      valueText: _bmiLogics.height,
      isThisBoxSelected: !isWeightTextSelected,
      unitLists: heightLists,
      selectedItem: heightItem,
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            runSpacing: 10, spacing: 10,
            children: [
              Container(// * : Bottom Sheet Heading
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Select unit",
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Wrap(
                children: [
                  Container(// * : Unit Container
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                style: const TextStyle(color: Colors.white, fontSize: 16),
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
              Padding(// * : Cancel button
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                      ),
                      padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                    ),
                    child: const Text(
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
      // TODO: Add any necessary logic after closing the bottom sheet
      // _areaLogics._convertUnit(isWeightTextSelected, weightItem, heightItem);
    });
  }

  Widget _buttonBox(BuildContext context) {
    Widget col1 = Wrap(
      direction: Axis.vertical, alignment: WrapAlignment.spaceBetween, spacing: 45,
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => _onButtonPressed("7", isWeightTextSelected, weightItem, heightItem),
          buttontext: "7", textColor: Theme.of(context).primaryColor, fontSize: 30
        ),
        CustomButtonWithText(// * : Four
          onTap: () => _onButtonPressed("4", isWeightTextSelected, weightItem, heightItem),
          buttontext: "4", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : One
          onTap: () => _onButtonPressed("1", isWeightTextSelected, weightItem, heightItem),
          buttontext: "1", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        const SizedBox(width: 60, height: 60)
      ],
    );

    Wrap col2 = Wrap(
      direction: Axis.vertical, alignment: WrapAlignment.spaceEvenly, spacing: 45,
      children: [
        CustomButtonWithText(// * : Eight
          onTap: () => _onButtonPressed("8", isWeightTextSelected, weightItem, heightItem),
          buttontext: "8", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => _onButtonPressed("5", isWeightTextSelected, weightItem, heightItem),
          buttontext: "5", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => _onButtonPressed("2", isWeightTextSelected, weightItem, heightItem),
          buttontext: "2", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => _onButtonPressed("0", isWeightTextSelected, weightItem, heightItem),
          buttontext: "0", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
      ],
    );

    Wrap col3 = Wrap(
      direction: Axis.vertical, alignment: WrapAlignment.spaceEvenly, spacing: 45,
      children: [
        CustomButtonWithText(// * : Nine
          onTap: () => _onButtonPressed("9", isWeightTextSelected, weightItem, heightItem),
          buttontext: "9", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => _onButtonPressed("6", isWeightTextSelected, weightItem, heightItem),
          buttontext: "6", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => _onButtonPressed("3", isWeightTextSelected, weightItem, heightItem),
          buttontext: "3", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
        CustomButtonWithText(// * : Decimal
          onTap: () => _onButtonPressed(".", isWeightTextSelected, weightItem, heightItem),
          buttontext: ".", textColor: Theme.of(context).primaryColor, fontSize: 30,
        ),
      ],
    );

    Wrap col4 = Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 20,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _bmiLogics._onAllClearPressed()),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            minimumSize: const MaterialStatePropertyAll(Size(90,120))
          ),
          child: const Text(
            "AC",
            style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),
          )
        ),
        ElevatedButton(
          onPressed: () => setState(() {
            _bmiLogics._onBackSpacePressed(isWeightTextSelected);
          }),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            minimumSize: const MaterialStatePropertyAll(Size(90,120))
          ),
          child: const Icon(
            LineAwesomeIcons.backspace,
            color: Colors.orange, size: 35,
          ),
        ),
        ElevatedButton(
          onPressed: () => setState(() {
            showBMI = true;
            _bmiLogics._calculateBmi(weightItem, heightItem);
          }),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade600.withOpacity(0.2)),
            overlayColor: const MaterialStatePropertyAll(Color(0x999E9E9E)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            minimumSize: const MaterialStatePropertyAll(Size(90,120))
          ),
          child: const Text(
            "GO",
            style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),
          )
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [col1, col2, col3, col4],
    );
  }

  Widget _bmiBox() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          border: Border.all(),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _bmiLogics.bmi,
                  style: const TextStyle(color: Colors.orange, fontSize: 75, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (() {
                        double bmiValue = double.tryParse(_bmiLogics.bmi) ?? 0;
                        if (bmiValue < 18.5) {
                          return "Underweight";
                        } else if (bmiValue >= 25) {
                          return "Overweight";
                        } else {
                          return "Normal";
                        }
                      })(),
                      style: TextStyle(
                        color: (() {
                          double bmiValue = double.tryParse(_bmiLogics.bmi) ?? 0;
                          if (bmiValue < 18.5) {
                            return const Color(0xff508fe5);
                          } else if (bmiValue >= 25) {
                            return const Color(0xffe65167);
                          } else {
                            return const Color(0xff15b26a);
                          }
                        })(),
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ],
            ),
            const Divider(thickness: 5, color: Colors.grey),
            const SizedBox(height: 15,),
            const Text(
              "Information",
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Underweight",
                  style: TextStyle(color: Color(0xff508fe5), fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Normal",
                  style: TextStyle(color: Color(0xff5bb901), fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Overweight",
                  style: TextStyle(color: Color(0xffe65167), fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 5, width: 90, color: const Color(0xff508fe5)),
                Container(height: 5, width: 90, color: const Color(0xff5bb901)),
                Container(height: 5, width: 90, color: const Color(0xffe65167)),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "16.0",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "18.5",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "25.0",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "40.0",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BmiLogics {
  String weight = "0";
  String height = "0";
  String bmi = "";

  void _onButtonPressed(BuildContext context, String buttonText, bool isWeight) {
    if (isWeight) {
      weight = _updateText(context, weight, buttonText);
    } else {
      height = _updateText(context, height, buttonText);
    }
  }

  String _updateText(BuildContext context, String currentText, String newText) {
    if(currentText.length == 6) {
      customSnackbar(context: context, message: "Max characters reached");
      return currentText;
    }
    return (currentText == "0") ? newText : currentText + newText;
  }

  void _onAllClearPressed() {
    weight = "0";
    height = "0";
  }

  void _onBackSpacePressed(bool isWeight) {
    if (isWeight) {
      weight = _removeLastCharacter(weight);
    } else {
      height = _removeLastCharacter(height);
    }
  }

  String _removeLastCharacter(String text) {
    return (text.length > 1) ? text.substring(0, text.length - 1) : "0";
  }

  double _convertWeightUnit(int weightUnit) {
    double weightInput = double.parse(weight);
    double weightFinal = 0;

    switch(weightUnit){
      case 0: weightFinal = weightInput; break; // Kilograms to Kilograms
      case 1: weightFinal = weightInput / 2.20462; break;  // Pounds to Kilograms
    }

    return weightFinal;
  }

  double _convertHeightUnit(int heightUnit) {
    double heightInput = double.parse(height);
    double heightFinal = 0;

    switch(heightUnit){
      case 0: heightFinal = heightInput / 100; break; // Centimeters to Meters
      case 1: heightFinal = heightInput; break; // Meters to Meters
      case 2: heightFinal = heightInput / 3.28084; break; // Feet to Meters
      case 3: heightFinal = heightInput * 0.0254; break; // Inches to Meters
    }

    return heightFinal;
  }

  void _calculateBmi(int weightUnit, int heightUnit) {
    double weightValue = _convertWeightUnit(weightUnit);
    double heightValue = _convertHeightUnit(heightUnit);
    double bmiValue = 0;

    bmiValue = weightValue / (heightValue * heightValue);
    bmi = bmiValue.toStringAsFixed(2);
  }
}