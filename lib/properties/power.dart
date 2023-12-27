enum POWER {
  watt,
  milliwatt,
  kilowatt,
  megawatt,
  gigawatt,
  europeanHorsePower,
  imperialHorsePower,
}

class PowerConverter {
  static List<String> powerName = ["Watt", "Milliwatt", "Kilowatt", "Megawatt", "Gigawatt", "European Horse Power", "Imperial Horse Power"];
  static List<String> powerSymbols = ["W", "mW", "kW", "MW", "GW", "ehp", "ihp"];

  static const _toWatt = {
    POWER.watt: 1.0,
    POWER.milliwatt: 0.001,
    POWER.kilowatt: 1000.0,
    POWER.megawatt: 1000000.0,
    POWER.gigawatt: 1000000000.0,
    POWER.europeanHorsePower: 736.0,
    POWER.imperialHorsePower: 745.7,
  };

  static const _fromWatt = {
    POWER.watt: 1.0,
    POWER.milliwatt: 1000.0,
    POWER.kilowatt: 0.001,
    POWER.megawatt: 0.000001,
    POWER.gigawatt: 0.000000001,
    POWER.europeanHorsePower: 1 / 736.0,
    POWER.imperialHorsePower: 1 / 745.7,
  };

  static POWER getPowerEnum(int index) {
    return POWER.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getPowerEnum(from);
    var toEnum = getPowerEnum(to);

    var watts = value * _toWatt[fromEnum]!;

    if (_fromWatt[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return watts * _fromWatt[toEnum]!;
  }
}
