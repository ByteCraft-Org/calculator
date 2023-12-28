import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20
      ),
      children: [
        ConverterTabButton(
          onTap: () {},
          icon: FontAwesomeIcons.cakeCandles,
          label: "Age",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/acceleration.svg",
          label: "Acceleration",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/angle.svg",
          label: "Angle",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/area.svg",
          label: "Area",
        ),
        ConverterTabButton(
          onTap: () {},
          icon: LineAwesomeIcons.weight,
          label: "BMI",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/density.svg",
          label: "Density",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.calendar_month,
          label: "Date",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/digitalData.svg",
          label: "Digital Data",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.discount_rounded,
          label: "Discount",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/electricCharge.svg",
          label: "Electric Charge",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/energy.svg",
          label: "Energy",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/force.svg",
          label: "Force",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/frequency.svg",
          label: "Frequency",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/fuelConsumption.svg",
          label: "Fuel Consumption",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/illuminance.svg",
          label: "Illuminance",
        ),
        ConverterTabButton(
          onTap: () {},
          icon: FontAwesomeIcons.rulerHorizontal,
          label: "Length",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/molarMass.svg",
          label: "Molar Mass",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/molarVolume.svg",
          label: "Molar Volume",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: LineAwesomeIcons.hanging_weight,
          label: "Mass",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: const IconData(0x24F5),
          label: "Numeral Systems",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/power.svg",
          label: "Power",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/pressure.svg",
          label: "Pressure",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.speed,
          label: "Speed",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: FontAwesomeIcons.temperatureQuarter,
          label: "Temprature",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: const IconData(0x23F1),
          label: "Time",
        ),
        ConverterTabButton(
          onTap: () {},
          assetPath: "assets/svg/units/torque.svg",
          label: "Torque",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: LineAwesomeIcons.cube,
          label: "Volume",
        ),
      ],
    );
  }
}