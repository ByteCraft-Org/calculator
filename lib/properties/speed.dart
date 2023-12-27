enum SPEED {
  metersPerSecond,
  kilometersPerHour,
  milesPerHour,
  knots,
  feetsPerSecond,
  minutesPerKilometer,
}

class SpeedConverter {
  static List<String> speedName = ["Meters Per Second", "Kilometers Per Hour", "Miles Per Hour", "Knots", "Feets Per Second", "Minutes Per Kilometer"];
  static List<String> speedSymbols = ["m/s", "km/h", "mi/h", "kts", "ft/s", "min/km"];

  static const _toMetersPerSecond = {
    SPEED.metersPerSecond: 1.0,
    SPEED.kilometersPerHour: 1.0 / 3.6,
    SPEED.milesPerHour: 0.44704,
    SPEED.knots: 0.51444,
    SPEED.feetsPerSecond: 0.3048,
    SPEED.minutesPerKilometer: 16.6667,
  };

  static const _fromMetersPerSecond = {
    SPEED.metersPerSecond: 1.0,
    SPEED.kilometersPerHour: 3.6,
    SPEED.milesPerHour: 2.23694,
    SPEED.knots: 1.94384,
    SPEED.feetsPerSecond: 3.28084,
    SPEED.minutesPerKilometer: 0.06,
  };

  static SPEED getSpeedEnum(int index) {
    return SPEED.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getSpeedEnum(from);
    var toEnum = getSpeedEnum(to);

    var metersPerSecond = value * _toMetersPerSecond[fromEnum]!;

    if (_fromMetersPerSecond[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return metersPerSecond * _fromMetersPerSecond[toEnum]!;
  }
}
