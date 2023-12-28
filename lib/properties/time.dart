import 'package:calculator/properties/converter.dart';

enum TIME {
  seconds,
  deciseconds,
  centiseconds,
  milliseconds,
  microseconds,
  nanoseconds,
  minutes,
  hours,
  days,
  weeks,
  years365,
  lustrum,
  decades,
  centuries,
  millennium,
}

class TimeConverter implements Converter<int> {
  static List<String> timeName = ["Seconds", "Deciseconds", "Centiseconds", "Milliseconds", "Microseconds", "Nanoseconds", "Minutes", "Hours", "Days", "Weeks", "Years365", "Lustrum", "Decades", "Centuries", "Millennium"];
  static List<String> timeSymbols = ["s", "ds", "cs", "ms", "µs", "ns", "min", "hr", "days", "weeks", "years", "lustrum", "decades", "centuries", "millennium"];

  static const _toSeconds = {
    TIME.seconds: 1.0,
    TIME.deciseconds: 0.1,
    TIME.centiseconds: 0.01,
    TIME.milliseconds: 0.001,
    TIME.microseconds: 0.000001,
    TIME.nanoseconds: 0.000000001,
    TIME.minutes: 60.0,
    TIME.hours: 3600.0,
    TIME.days: 86400.0,
    TIME.weeks: 604800.0,
    TIME.years365: 31536000.0,
    TIME.lustrum: 157680000.0,
    TIME.decades: 315360000.0,
    TIME.centuries: 3153600000.0,
    TIME.millennium: 31536000000.0,
  };

  static const _fromSeconds = {
    TIME.seconds: 1.0,
    TIME.deciseconds: 10.0,
    TIME.centiseconds: 100.0,
    TIME.milliseconds: 1000.0,
    TIME.microseconds: 1000000.0,
    TIME.nanoseconds: 1000000000.0,
    TIME.minutes: 1 / 60.0,
    TIME.hours: 1 / 3600.0,
    TIME.days: 1 / 86400.0,
    TIME.weeks: 1 / 604800.0,
    TIME.years365: 1 / 31536000.0,
    TIME.lustrum: 1 / 157680000.0,
    TIME.decades: 1 / 315360000.0,
    TIME.centuries: 1 / 3153600000.0,
    TIME.millennium: 1 / 31536000000.0,
  };

  static TIME getTimeEnum(int index) {
    return TIME.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getTimeEnum(from);
    var toEnum = getTimeEnum(to);

    if (_toSeconds[fromEnum] == null || _fromSeconds[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return value * _toSeconds[fromEnum]! * _fromSeconds[toEnum]!;
  }
}
