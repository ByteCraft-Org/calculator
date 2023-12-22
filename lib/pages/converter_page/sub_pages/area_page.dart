// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AreaPage extends StatefulWidget {
  AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  List<String> unitNameLists = ["Square Kilometer", "Hectare", "Are", "Square meter", "Square decimeter", "Square centimeter","Square millimeter","Square micron", "Acre", "Square mile", "Square yard", "Square foot", "Square inch", "Square rod", "Qing", "Mu", "Square chi", "Square cun", "Square kilometer"];

  List<String> unitSymbolLists = ["km2", "ha", "a", "m2", "dm2", "cm2", "mm2", "μm2", "ac", "mile2", "yd2", "ft2", "in2", "rd2", "qing", "mu" "chi2", "cun2", "gongli2"];

  String firstUnitBtnText = "km2";

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
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomDialog(context),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: firstUnitBtnText.endsWith("2")
                  ? firstUnitBtnText.substring(0, firstUnitBtnText.length - 1)
                  : firstUnitBtnText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if(firstUnitBtnText.endsWith("2"))
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(0, -3),
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
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
        ),
      ),
    );
  }

  void _showBottomDialog(BuildContext context) {
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
                height: 350,
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
                                  text: "${unitNameLists[index]} ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
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
                              firstUnitBtnText = unitSymbolLists[index];
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
                    onPressed: () => Navigator.pop(context),
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
      }
    );
  }
}
