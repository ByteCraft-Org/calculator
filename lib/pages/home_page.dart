// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator/utils/widgets/custom_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String appbarTitle = "Standard";

  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        drawer: _drawer(),
        body: _body(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        appbarTitle,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
      ),
      actions: [
        InkResponse(
          onTap: () {},
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          overlayColor: const MaterialStatePropertyAll(Colors.grey),
          child: SvgPicture.asset("assets/svg/historyDelete.svg",
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
        ),
        const Padding(padding: EdgeInsets.only(right: 15))
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.grey),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              iconColor: MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(EdgeInsets.all(16))
            ),
            child: Row(
              children: [
                const Icon(Icons.menu, size: 30),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                CustomListHeading(title: "Calculator"),
                CustomListTiles(// * : Standard Calculator
                  onTap: (){
                    setState(() => currentItem = 0);
                  },
                  currentIndex: currentItem, thisIndex: 0, icon: FontAwesomeIcons.calculator, label: "Standard",
                ),
                CustomListTiles(// * : Scientific Calculator
                  onTap: (){
                    setState(() => currentItem = 1);
                  },
                  currentIndex: currentItem, thisIndex: 1, icon: FontAwesomeIcons.flask, label: "Scientific",
                ),
                CustomListHeading(title: "Converter"),
                CustomListTiles(// * : Age Converter
                  onTap: (){
                    setState(() => currentItem = 2);
                  },
                  currentIndex: currentItem, thisIndex: 2, icon: FontAwesomeIcons.cakeCandles, label: "Age",
                ),
                CustomListTiles(// * : Acceleration Converter
                  onTap: (){
                    setState(() => currentItem = 3);
                  },
                  currentIndex: currentItem, thisIndex: 3, assetPath: "assets/svg/units/acceleration.svg", label: "Acceleration",
                ),
                CustomListTiles(// * : Angle Converter
                  onTap: (){
                    setState(() => currentItem = 4);
                  },
                  currentIndex: currentItem, thisIndex: 4, assetPath: "assets/svg/units/angle.svg", label: "Angle",
                ),
                CustomListTiles(// * : Area Converter
                  onTap: (){
                    setState(() => currentItem = 5);
                  },
                  currentIndex: currentItem, thisIndex: 5, assetPath: "assets/svg/units/area.svg", label: "Area",
                ),
                CustomListTiles(// * : BMI Converter
                  onTap: (){
                    setState(() => currentItem = 6);
                  },
                  currentIndex: currentItem, thisIndex: 6, icon: LineAwesomeIcons.weight, label: "Bmi",
                ),
                CustomListTiles(// * : Density Converter
                  onTap: (){
                    setState(() => currentItem = 7);
                  },
                  currentIndex: currentItem, thisIndex: 7, assetPath: "assets/svg/units/density.svg", label: "Density",
                ),
                CustomListTiles(// * : Date Converter
                  onTap: (){
                    setState(() => currentItem = 8);
                  },
                  currentIndex: currentItem, thisIndex: 8, icon: Icons.calendar_month, label: "Date",
                ),
                CustomListTiles(// * : Digital Data Converter
                  onTap: (){
                    setState(() => currentItem = 9);
                  },
                  currentIndex: currentItem, thisIndex: 9, assetPath: "assets/svg/units/digitalData.svg", label: "Digital Data",
                ),
                CustomListTiles(// * : Discount Converter
                  onTap: (){
                    setState(() => currentItem = 10);
                  },
                  currentIndex: currentItem, thisIndex: 10, icon: Icons.discount_rounded, label: "Discount",
                ),
                CustomListTiles(// * : Electric Charge Converter
                  onTap: (){
                    setState(() => currentItem = 11);
                  },
                  currentIndex: currentItem, thisIndex: 11, assetPath: "assets/svg/units/electricCharge.svg", label: "Electric Charge",
                ),
                CustomListTiles(// * : Energy Converter
                  onTap: (){
                    setState(() => currentItem = 12);
                  },
                  currentIndex: currentItem, thisIndex: 12, assetPath: "assets/svg/units/energy.svg", label: "Energy",
                ),
                CustomListTiles(// * : Force Converter
                  onTap: (){
                    setState(() => currentItem = 13);
                  },
                  currentIndex: currentItem, thisIndex: 13, assetPath: "assets/svg/units/force.svg", label: "Force",
                ),
                CustomListTiles(// * : Frequency Converter
                  onTap: (){
                    setState(() => currentItem = 14);
                  },
                  currentIndex: currentItem, thisIndex: 14, assetPath: "assets/svg/units/frequency.svg", label: "Frequency",
                ),
                CustomListTiles(// * : Fuel Consumption Converter
                  onTap: (){
                    setState(() => currentItem = 15);
                  },
                  currentIndex: currentItem, thisIndex: 15, assetPath: "assets/svg/units/fuelConsumption.svg", label: "Fuel Efficiency",
                ),
                CustomListTiles(// * : Illuminance Converter
                  onTap: (){
                    setState(() => currentItem = 16);
                  },
                  currentIndex: currentItem, thisIndex: 16, assetPath: "assets/svg/units/illuminance.svg", label: "Illuminance",
                ),
                CustomListTiles(// * : Length Converter
                  onTap: (){
                    setState(() => currentItem = 17);
                  },
                  currentIndex: currentItem, thisIndex: 17, icon: FontAwesomeIcons.rulerHorizontal, label: "Length",
                ),
                CustomListTiles(// * : Mass Converter
                  onTap: (){
                    setState(() => currentItem = 18);
                  },
                  currentIndex: currentItem, thisIndex: 18, icon: LineAwesomeIcons.hanging_weight, label: "Mass",
                ),
                CustomListTiles(// * : Molar Mass Converter
                  onTap: (){
                    setState(() => currentItem = 19);
                  },
                  currentIndex: currentItem, thisIndex: 19, assetPath: "assets/svg/units/molarMass.svg", label: "Molar Mass",
                ),
                CustomListTiles(// * : Molar Volume Converter
                  onTap: (){
                    setState(() => currentItem = 20);
                  },
                  currentIndex: currentItem, thisIndex: 20, assetPath: "assets/svg/units/molarVolume.svg", label: "Molar Volume",
                ),
                CustomListTiles(// * : Power Converter
                  onTap: (){
                    setState(() => currentItem = 21);
                  },
                  currentIndex: currentItem, thisIndex: 21, assetPath: "assets/svg/units/power.svg", label: "Power",
                ),
                CustomListTiles(// * : Pressure Converter
                  onTap: (){
                    setState(() => currentItem = 22);
                  },
                  currentIndex: currentItem, thisIndex: 22, assetPath: "assets/svg/units/pressure.svg", label: "Pressure",
                ),
                CustomListTiles(// * : Speed Converter
                  onTap: (){
                    setState(() => currentItem = 23);
                  },
                  currentIndex: currentItem, thisIndex: 23, icon: Icons.speed, label: "Speed",
                ),
                CustomListTiles(// * : Temprature Converter
                  onTap: (){
                    setState(() => currentItem = 24);
                  },
                  currentIndex: currentItem, thisIndex: 24, icon: FontAwesomeIcons.temperatureQuarter, label: "Temprature",
                ),
                CustomListTiles(// * : Time Converter
                  onTap: (){
                    setState(() => currentItem = 25);
                  },
                  currentIndex: currentItem, thisIndex: 25, icon: const IconData(0x23F1), label: "Time",
                ),
                CustomListTiles(// * : Torque Converter
                  onTap: (){
                    setState(() => currentItem = 26);
                  },
                  currentIndex: currentItem, thisIndex: 26, assetPath: "assets/svg/units/torque.svg", label: "Torque",
                ),
                CustomListTiles(// * : Volume Converter
                  onTap: (){
                    setState(() => currentItem = 27);
                  },
                  currentIndex: currentItem, thisIndex: 27, icon: LineAwesomeIcons.cube, label: "Volume",
                ),
              ],
            ),
          ),
          Divider(),
          ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.grey),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              iconColor: MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(EdgeInsets.all(20))
            ),
            child: Row(
              children: [
                const Icon(Icons.settings, size: 30),
                SizedBox(width: 10),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      // child: Expanded(child: CalculatorPage())
    );
  }
}