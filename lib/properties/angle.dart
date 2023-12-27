enum ANGLE {
  degree,
  minutes,
  seconds,
  radians,
}

class AngleConverter {
  static List<String> angleName = ["Degree", "Minutes", "Seconds", "Radians"];
  static List<String> angleSymbols = ["°", "'", "''", "rad"];

  static const _toRadians = {
    ANGLE.degree: 0.0174533, // 1 degree = 0.0174533 radians
    ANGLE.minutes: 0.000290888, // 1 minute = 0.000290888 radians
    ANGLE.seconds: 0.000004848, // 1 second = 0.000004848 radians
    ANGLE.radians: 1.0,
  };

  static const _fromRadians = {
    ANGLE.degree: 57.2958, // 1 radian = 57.2958 degrees
    ANGLE.minutes: 3437.75, // 1 radian = 3437.75 minutes
    ANGLE.seconds: 206265.0, // 1 radian = 206265 seconds
    ANGLE.radians: 1.0,
  };

  static ANGLE getAngleEnum(int index) {
    return ANGLE.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getAngleEnum(from);
    var toEnum = getAngleEnum(to);

    var radians = value * _toRadians[fromEnum]!;

    if (_fromRadians[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return radians * _fromRadians[toEnum]!;
  }
}
