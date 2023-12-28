import 'package:calculator/properties/converter.dart';

enum FUEL_CONSUMPTION {
  kilometersPerLiter,
  litersPer100km,
  milesPerUsGallon,
  milesPerImperialGallon,
}

class FuelConsumptionConverter implements Converter<int> {
  static List<String> fuelConsumptionName = ["Kilometers Per Liter", "Liters Per100km", "Miles Per Us Gallon", "Miles Per Imperial Gallon"];
  static List<String> fuelConsumptionSymbols = ["km/l", "l/100km", "mpg"];

  static const _toKilometersPerLiter = {
    FUEL_CONSUMPTION.kilometersPerLiter: 1.0,
    FUEL_CONSUMPTION.litersPer100km: 100.0,
    FUEL_CONSUMPTION.milesPerUsGallon: 0.425144,
    FUEL_CONSUMPTION.milesPerImperialGallon: 0.354006,
  };

  static const _fromKilometersPerLiter = {
    FUEL_CONSUMPTION.kilometersPerLiter: 1.0,
    FUEL_CONSUMPTION.litersPer100km: 0.01,
    FUEL_CONSUMPTION.milesPerUsGallon: 2.35215,
    FUEL_CONSUMPTION.milesPerImperialGallon: 2.82481,
  };

  static FUEL_CONSUMPTION getFuelConsumptionEnum(int index) {
    return FUEL_CONSUMPTION.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getFuelConsumptionEnum(from);
    var toEnum = getFuelConsumptionEnum(to);

    var kilometersPerLiter = value * _toKilometersPerLiter[fromEnum]!;

    if (_fromKilometersPerLiter[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return kilometersPerLiter * _fromKilometersPerLiter[toEnum]!;
  }
}
