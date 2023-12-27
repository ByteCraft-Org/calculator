enum FREQUENCY {
  hertz,
  kilohertz,
  megahertz,
  gigahertz,
  terahertz,
  revolutionsPerMinute,
  cyclesPerSecond,
  beatsPerMinute,
}

class FrequencyConverter {
  static List<String> frequencyName = ["Hertz", "Kilohertz", "Megahertz", "Gigahertz", "Terahertz", "Revolutions Per Minute", "Cycles Per Second", "Beats Per Minute"];
  static List<String> frequencySymbols = ["Hz", "kHz", "MHz", "GHz", "THz", "rpm", "cps", "bpm"];

  static const _toHertz = {
    FREQUENCY.hertz: 1.0,
    FREQUENCY.kilohertz: 1000.0,
    FREQUENCY.megahertz: 1000000.0,
    FREQUENCY.gigahertz: 1000000000.0,
    FREQUENCY.terahertz: 1000000000000.0,
    FREQUENCY.revolutionsPerMinute: 1 / 60.0,
    FREQUENCY.cyclesPerSecond: 1.0,
    FREQUENCY.beatsPerMinute: 1 / 60.0,
  };

  static const _fromHertz = {
    FREQUENCY.hertz: 1.0,
    FREQUENCY.kilohertz: 0.001,
    FREQUENCY.megahertz: 0.000001,
    FREQUENCY.gigahertz: 0.000000001,
    FREQUENCY.terahertz: 0.000000000001,
    FREQUENCY.revolutionsPerMinute: 60.0,
    FREQUENCY.cyclesPerSecond: 1.0,
    FREQUENCY.beatsPerMinute: 60.0,
  };

  static FREQUENCY getFrequencyEnum(int index) {
    return FREQUENCY.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getFrequencyEnum(from);
    var toEnum = getFrequencyEnum(to);

    var hertz = value * _toHertz[fromEnum]!;

    if (_fromHertz[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return hertz * _fromHertz[toEnum]!;
  }
}
