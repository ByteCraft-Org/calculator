import 'package:calculator/properties/converter.dart';

enum TORQUE {
  newtonMeter,
  dyneMeter,
  poundForceFeet,
  kilogramForceMeter,
  poundalMeter,
}

class TorqueConverter implements Converter<int> {
  static List<String> torqueName = ["Newton Meter", "Dyne Meter", "Pound Force Feet", "Kilogram Force Meter", "Poundal Meter"];
  static List<String> torqueSymbols = ["N·m", "dyn·m", "lbf·ft", "kgf·m", "pdl·m"];

  static const _toNewtonMeter = {
    TORQUE.newtonMeter: 1.0,
    TORQUE.dyneMeter: 0.00001,
    TORQUE.poundForceFeet: 1.35582,
    TORQUE.kilogramForceMeter: 9.80665,
    TORQUE.poundalMeter: 0.04214,
  };

  static const _fromNewtonMeter = {
    TORQUE.newtonMeter: 1.0,
    TORQUE.dyneMeter: 100000.0,
    TORQUE.poundForceFeet: 0.737562,
    TORQUE.kilogramForceMeter: 0.101972,
    TORQUE.poundalMeter: 23.7302,
  };

  static TORQUE getTorqueEnum(int index) {
    return TORQUE.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getTorqueEnum(from);
    var toEnum = getTorqueEnum(to);

    if (_toNewtonMeter[fromEnum] == null || _fromNewtonMeter[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return value * _toNewtonMeter[fromEnum]! * _fromNewtonMeter[toEnum]!;
  }
}
