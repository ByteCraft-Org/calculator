import 'package:calculator/properties/converter.dart';

enum ACCELERATION {
  metersPerSecondSquared,
  kilometersPerHourSquared,
  milesPerHourSquared,
  feetPerSecondSquared,
  gravity,
  galileo,
  standardGravity,
}

class AccelerationConverter  implements Converter<int> {
  static List<String> accelerationName = ["Meters Per Second Squared", "Kilometers Per Hour Squared", "Miles Per Hour Squared", "Feet Per Second Squared", "Gravity", "Galileo", "Standard Gravity"];
  static List<String> accelerationSymbols = [
    "m/s²", "km/h²", "mi/h²", "ft/s²", "g", "Gal", "standard g"];

  static const _toMetersPerSecondSquared = {
    ACCELERATION.metersPerSecondSquared: 1.0,
    ACCELERATION.kilometersPerHourSquared: 0.000277778, // 1 m/s^2 = 0.000277778 km/h^2
    ACCELERATION.milesPerHourSquared: 0.000045929, // 1 m/s^2 = 0.000045929 mi/h^2
    ACCELERATION.feetPerSecondSquared: 3.28084, // 1 m/s^2 = 3.28084 ft/s^2
    ACCELERATION.gravity: 0.101972, // 1 m/s^2 = 0.101972 g (standard gravity)
    ACCELERATION.galileo: 1.0, // 1 galileo = 1 m/s^2
    ACCELERATION.standardGravity: 1.0, // 1 standard gravity = 1 m/s^2
  };

  static const _fromMetersPerSecondSquared = {
    ACCELERATION.metersPerSecondSquared: 1.0,
    ACCELERATION.kilometersPerHourSquared: 3600.0, // 1 km/h^2 = 3600 m/s^2
    ACCELERATION.milesPerHourSquared: 1935360.0, // 1 mi/h^2 = 1935360 m/s^2
    ACCELERATION.feetPerSecondSquared: 0.3048, // 1 ft/s^2 = 0.3048 m/s^2
    ACCELERATION.gravity: 9.80665, // 1 g = 9.80665 m/s^2 (standard gravity)
    ACCELERATION.galileo: 1.0, // 1 galileo = 1 m/s^2
    ACCELERATION.standardGravity: 1.0, // 1 standard gravity = 1 m/s^2
  };

  static ACCELERATION _getAccelerationEnum(int index) {
    return ACCELERATION.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = _getAccelerationEnum(from);
    var toEnum = _getAccelerationEnum(to);

    var metersPerSecondSquared = value * _toMetersPerSecondSquared[fromEnum]!;

    if (_fromMetersPerSecondSquared[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return metersPerSecondSquared * _fromMetersPerSecondSquared[toEnum]!;
  }
}
