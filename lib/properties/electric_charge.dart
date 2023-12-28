import 'package:calculator/properties/converter.dart';

enum ELECTRIC_CHARGE {
  coulombs,
  milliCoulombs,
  microCoulombs,
  nanoCoulombs,
  picoCoulombs,
  ampereHours,
  kiloampereHours,
  megaampereHours,
  faraday,
}

class ElectricChargeConverter implements Converter<int> {
  static List<String> electricChargeName = ["Coulombs", "Milli Coulombs", "Micro Coulombs", "Nano Coulombs", "Pico Coulombs", "Ampere Hours", "Kiloampere Hours", "Megaampere Hours", "Faraday"];
  static List<String> electricChargeSymbols = [ "C", "mC", "µC", "nC", "pC", "Ah", "kAh", "MAh", "faraday"];

  static const _toCoulombs = {
    ELECTRIC_CHARGE.coulombs: 1.0,
    ELECTRIC_CHARGE.milliCoulombs: 0.001,
    ELECTRIC_CHARGE.microCoulombs: 0.000001,
    ELECTRIC_CHARGE.nanoCoulombs: 0.000000001,
    ELECTRIC_CHARGE.picoCoulombs: 0.000000000001,
    ELECTRIC_CHARGE.ampereHours: 3600.0,
    ELECTRIC_CHARGE.kiloampereHours: 0.000000277778,
    ELECTRIC_CHARGE.megaampereHours: 0.000000000277778,
    ELECTRIC_CHARGE.faraday: 96485.3,
  };

  static const _fromCoulombs = {
    ELECTRIC_CHARGE.coulombs: 1.0,
    ELECTRIC_CHARGE.milliCoulombs: 1000.0,
    ELECTRIC_CHARGE.microCoulombs: 1000000.0,
    ELECTRIC_CHARGE.nanoCoulombs: 1000000000.0,
    ELECTRIC_CHARGE.picoCoulombs: 1000000000000.0,
    ELECTRIC_CHARGE.ampereHours: 0.000277778,
    ELECTRIC_CHARGE.kiloampereHours: 3600000.0,
    ELECTRIC_CHARGE.megaampereHours: 3600000000.0,
    ELECTRIC_CHARGE.faraday: 1 / 96485.3,
  };

  static ELECTRIC_CHARGE getElectricChargeEnum(int index) {
    return ELECTRIC_CHARGE.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getElectricChargeEnum(from);
    var toEnum = getElectricChargeEnum(to);

    var coulombs = value * _toCoulombs[fromEnum]!;

    if (_fromCoulombs[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return coulombs * _fromCoulombs[toEnum]!;
  }
}
