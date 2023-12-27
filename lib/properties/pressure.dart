enum PRESSURE {
  pascal,
  atmosphere,
  bar,
  millibar,
  psi,
  torr, // Same as mmHg
  hectoPascal,
  inchOfMercury,
}

class PressureConverter {
  static List<String> pressureName = ["Pascal", "Atmosphere", "Bar", "Millibar", "Psi", "Torr", "Hecto Pascal", "Inch Of Mercury"];
  static List<String> pressureSymbols = ["Pa", "atm", "bar", "mbar", "psi", "Torr", "hPa", "inHg"];


  static const _toPascal = {
    PRESSURE.pascal: 1.0,
    PRESSURE.atmosphere: 101325.0,
    PRESSURE.bar: 100000.0,
    PRESSURE.millibar: 100.0,
    PRESSURE.psi: 6894.76,
    PRESSURE.torr: 133.322,
    PRESSURE.hectoPascal: 100.0,
    PRESSURE.inchOfMercury: 3386.39,
  };

  static const _fromPascal = {
    PRESSURE.pascal: 1.0,
    PRESSURE.atmosphere: 1 / 101325.0,
    PRESSURE.bar: 1 / 100000.0,
    PRESSURE.millibar: 1 / 100.0,
    PRESSURE.psi: 1 / 6894.76,
    PRESSURE.torr: 1 / 133.322,
    PRESSURE.hectoPascal: 1 / 100.0,
    PRESSURE.inchOfMercury: 1 / 3386.39,
  };

  static PRESSURE getPressureEnum(int index) {
    return PRESSURE.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getPressureEnum(from);
    var toEnum = getPressureEnum(to);

    var pascals = value * _toPascal[fromEnum]!;

    if (_fromPascal[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return pascals * _fromPascal[toEnum]!;
  }
}
