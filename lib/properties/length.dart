// Enum for units
enum LENGTH {
  meters, 
  centimeters,
  inches,
  feet,
  yards,
  miles,
  millimeters,
  micrometers,
  nanometers,
  angstroms,
  picometers,
  kilometers,
  astronomicalUnits,
  lightYears,
  parsec,
  mils
}
class LengthConverter {
  static List<String> lengthName = ["Meters", "Centimeters", "Inches", "Feet", "Feet Us", "Nautical Miles", "Yards", "Miles", "Millimeters", "Micrometers", "Nanometers", "Angstroms", "Picometers", "Kilometers", "Astronomical Units", "Light Years", "Parsec", "Mils"];
  static List<String> lengthSymbols = ["m", "cm", "in", "ft", "M", "yd", "mi", "mm", "µm", "nm", "Å", "pm", "km", "au", "ly", "pc", "th"];

  static const _toMeters = {
    LENGTH.meters: 1.0,
    LENGTH.centimeters: 0.01,
    LENGTH.inches: 0.0254,
    LENGTH.feet: 0.3048,
    LENGTH.yards: 0.9144,
    LENGTH.miles: 1609.344,
    LENGTH.millimeters: 0.001,
    LENGTH.micrometers: 0.000001,
    LENGTH.nanometers: 0.000000001,
    LENGTH.angstroms: 0.0000000001,
    LENGTH.picometers: 0.000000000001,
    LENGTH.kilometers: 1000,
    LENGTH.astronomicalUnits: 149597870700,
    LENGTH.lightYears: 9460730472580800,
    LENGTH.parsec: 30856776376340000,
    LENGTH.mils: 0.0000254
  };
  
  static const _fromMeters = {
    LENGTH.meters: 1.0,
    LENGTH.centimeters: 100,
    LENGTH.inches: 1/0.0254,
    LENGTH.feet: 1/0.3048,
    LENGTH.yards: 1/0.9144,
    LENGTH.miles: 1/1609.344,
    LENGTH.millimeters: 1000,
    LENGTH.micrometers: 1000000,
    LENGTH.nanometers: 1000000000,
    LENGTH.angstroms: 10000000000,
    LENGTH.picometers: 1000000000000, 
    LENGTH.kilometers: 0.001,
    LENGTH.astronomicalUnits: 1/149597870700,
    LENGTH.lightYears: 1/9460730472580800,
    LENGTH.parsec: 1/30856776376340000,
    LENGTH.mils: 1/0.0000254
  };

  static LENGTH _getLengthEnum(int index) {
    return LENGTH.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = _getLengthEnum(from);
    var toEnum = _getLengthEnum(to);

    var meters = value * _toMeters[fromEnum]!;
    
    if (_fromMeters[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }
    
    return meters * _fromMeters[toEnum]!;
  }
}
