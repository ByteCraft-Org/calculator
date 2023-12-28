import 'package:calculator/pages/converter_page/implementation.dart';
import 'package:calculator/properties/acceleration.dart';
import 'package:calculator/properties/angle.dart';
import 'package:calculator/properties/area.dart';
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Acceleration",
                unitNameLists: AccelerationConverter.accelerationName,
                unitSymbolLists: AccelerationConverter.accelerationSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/acceleration.svg",
          label: "Acceleration",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Angle",
                unitNameLists: AngleConverter.angleName,
                unitSymbolLists: AngleConverter.angleSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/angle.svg",
          label: "Angle",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Area",
                unitNameLists: AreaConverter.areaName,
                unitSymbolLists: AreaConverter.areaSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/area.svg",
          label: "Area",
        ),
        ConverterTabButton(
          onTap: () {},
          icon: LineAwesomeIcons.weight,
          label: "BMI",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Density",
                unitNameLists: DensityConverter.densityName,
                unitSymbolLists: DensityConverter.densitySymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/density.svg",
          label: "Density",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.calendar_month,
          label: "Date",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Digital Data",
                unitNameLists: DigitalDataConverter.digitalDataName,
                unitSymbolLists: DigitalDataConverter.digitalDataSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/digitalData.svg",
          label: "Digital Data",
        ),
        ConverterTabButton(
          onTap: () => {},
          icon: Icons.discount_rounded,
          label: "Discount",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Electric Charge",
                unitNameLists: ElectricChargeConverter.electricChargeName,
                unitSymbolLists: ElectricChargeConverter.electricChargeSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/electricCharge.svg",
          label: "Electric Charge",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Energy",
                unitNameLists: EnergyConverter.energyName,
                unitSymbolLists: EnergyConverter.energySymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/energy.svg",
          label: "Energy",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Force",
                unitNameLists: ForceConverter.forceName,
                unitSymbolLists: ForceConverter.forceSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/force.svg",
          label: "Force",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Frequency",
                unitNameLists: FrequencyConverter.frequencyName,
                unitSymbolLists: FrequencyConverter.frequencySymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/frequency.svg",
          label: "Frequency",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Fuel Consumption",
                unitNameLists: FuelConsumptionConverter.fuelConsumptionName,
                unitSymbolLists: FuelConsumptionConverter.fuelConsumptionSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/fuelConsumption.svg",
          label: "Fuel Consumption",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Illuminance",
                unitNameLists: IlluminanceConverter.illuminanceName,
                unitSymbolLists: IlluminanceConverter.illuminanceSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/illuminance.svg",
          label: "Illuminance",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Length",
                unitNameLists: LengthConverter.lengthName,
                unitSymbolLists: LengthConverter.lengthSymbols,
              ),
            )
          ),
          icon: FontAwesomeIcons.rulerHorizontal,
          label: "Length",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Molar Mass",
                unitNameLists: MolarMassConverter.molarMassName,
                unitSymbolLists: MolarMassConverter.molarMassSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/molarMass.svg",
          label: "Molar Mass",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Molar Volume",
                unitNameLists: MolarVolumeConverter.molarVolumeName,
                unitSymbolLists: MolarVolumeConverter.molarVolumeSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/molarVolume.svg",
          label: "Molar Volume",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Mass",
                unitNameLists: MassConverter.massName,
                unitSymbolLists: MassConverter.massSymbols,
              ),
            )
          ),
          icon: LineAwesomeIcons.hanging_weight,
          label: "Mass",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Power",
                unitNameLists: PowerConverter.powerName,
                unitSymbolLists: PowerConverter.powerSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/power.svg",
          label: "Power",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Pressure",
                unitNameLists: PressureConverter.pressureName,
                unitSymbolLists: PressureConverter.pressureSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/pressure.svg",
          label: "Pressure",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Speed",
                unitNameLists: SpeedConverter.speedName,
                unitSymbolLists: SpeedConverter.speedSymbols,
              ),
            )
          ),
          icon: Icons.speed,
          label: "Speed",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Temprature",
                unitNameLists: TemperatureConverter.temperatureName,
                unitSymbolLists: TemperatureConverter.temperatureSymbols,
              ),
            )
          ),
          icon: FontAwesomeIcons.temperatureQuarter,
          label: "Temprature",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Time",
                unitNameLists: TimeConverter.timeName ,
                unitSymbolLists: TimeConverter.timeSymbols,
              ),
            )
          ),
          icon: const IconData(0x23F1),
          label: "Time",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Torque",
                unitNameLists: TorqueConverter.torqueName,
                unitSymbolLists: TorqueConverter.torqueSymbols,
              ),
            )
          ),
          assetPath: "assets/svg/units/torque.svg",
          label: "Torque",
        ),
        ConverterTabButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImplementationPage(
                unitType: "Volume",
                unitNameLists: VolumeConverter.volumeName,
                unitSymbolLists: VolumeConverter.volumeSymbols,
              ),
            )
          ),
          icon: LineAwesomeIcons.cube,
          label: "Volume",
        ),
      ],
    );
  }
}