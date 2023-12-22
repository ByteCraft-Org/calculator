import 'package:calculator/pages/converter_page/sub_pages/age_page.dart';
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AgePage())
          ),
          icon: FontAwesomeIcons.cakeCandles,
          label: "Age",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: FontAwesomeIcons.chartArea,
          label: "Area",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: LineAwesomeIcons.weight,
          label: "BMI",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: IconData(0x3386),
          label: "Data",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.calendar_month,
          label: "Date",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.discount_rounded,
          label: "Discount",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: FontAwesomeIcons.rulerHorizontal,
          label: "Length",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: LineAwesomeIcons.hanging_weight,
          label: "Mass",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: IconData(0x24F5),
          label: "Numeral System",
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
          icon: IconData(0x23F1),
          label: "Time",
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