import 'package:calculator/properties/converter.dart';

enum FORCE {
  newton,
  dyne,
  poundForce,
  kilogramForce,
  poundal,
}

class ForceConverter implements Converter<int> {
  static List<String> forceName = ["Newton", "Dyne", "Pound Force", "Kilogram Force", "Poundal"];
  static List<String> forceSymbols = ["N", "dyn", "lbf", "kgf", "pdl"];

  static const _toNewton = {
    FORCE.newton: 1.0,
    FORCE.dyne: 0.00001,
    FORCE.poundForce: 4.44822,
    FORCE.kilogramForce: 9.80665,
    FORCE.poundal: 0.138255,
  };

  static const _fromNewton = {
    FORCE.newton: 1.0,
    FORCE.dyne: 100000.0,
    FORCE.poundForce: 0.224809,
    FORCE.kilogramForce: 0.101972,
    FORCE.poundal: 7.23301,
  };

  static FORCE getForceEnum(int index) {
    return FORCE.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getForceEnum(from);
    var toEnum = getForceEnum(to);

    var newton = value * _toNewton[fromEnum]!;

    if (_fromNewton[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return newton * _fromNewton[toEnum]!;
  }
}
