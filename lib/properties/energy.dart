enum ENERGY {
  joules,
  kilojoules,
  calories,
  kilocalories,
  kilowattHours,
  electronvolts,
  energyFootPound,
}

class EnergyConverter {
  static List<String> energyName = ["Joules", "Kilojoules", "Calories", "Kilocalories", "Kilowatt Hours", "Electronvolts", "Energy Foot Pound"];
  static List<String> energySymbols = ["J", "kJ", "cal", "kcal", "kWh", "eV", "ft⋅lbf"];

  static const _toJoules = {
    ENERGY.joules: 1.0,
    ENERGY.kilojoules: 1000.0,
    ENERGY.calories: 4184.0,
    ENERGY.kilocalories: 4184000.0,
    ENERGY.kilowattHours: 3600000.0,
    ENERGY.electronvolts: 0.000000000000000000160218,
    ENERGY.energyFootPound: 1.35582,
  };

  static const _fromJoules = {
    ENERGY.joules: 1.0,
    ENERGY.kilojoules: 0.001,
    ENERGY.calories: 0.000239006,
    ENERGY.kilocalories: 0.000239006,
    ENERGY.kilowattHours: 0.000000277778,
    ENERGY.electronvolts: 6242000000000000000.0,
    ENERGY.energyFootPound: 0.737562,
  };

  static ENERGY getEnergyEnum(int index) {
    return ENERGY.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getEnergyEnum(from);
    var toEnum = getEnergyEnum(to);

    var joules = value * _toJoules[fromEnum]!;

    if (_fromJoules[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return joules * _fromJoules[toEnum]!;
  }
}
