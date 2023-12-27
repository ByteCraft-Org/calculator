enum ILLUMINANCE {
  lux,
  footCandle,
}

class IlluminanceConverter {
  static List<String> illuminanceName = ["Lux", "Foot Candle"];
  static List<String> illuminanceSymbols = ["lx", "fc"];

  static const _toLux = {
    ILLUMINANCE.lux: 1.0,
    ILLUMINANCE.footCandle: 10.764,
  };

  static const _fromLux = {
    ILLUMINANCE.lux: 1.0,
    ILLUMINANCE.footCandle: 0.092903,
  };

  static ILLUMINANCE getIlluminanceEnum(int index) {
    return ILLUMINANCE.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getIlluminanceEnum(from);
    var toEnum = getIlluminanceEnum(to);

    var lux = value * _toLux[fromEnum]!;

    if (_fromLux[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return lux * _fromLux[toEnum]!;
  }
}
