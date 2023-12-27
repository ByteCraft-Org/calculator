enum AREA {
  squareMeters,
  squareCentimeters,
  squareInches,
  squareFeet,
  squareFeetUs,
  squareMiles,
  squareYard,
  squareMillimeters,
  squareKilometers,
  hectares,
  acres,
  are,
}

class AreaConverter {
  static List<String> areaName = ["Square Meters", "Square Centimeters", "Square Inches", "Square Feet", "Square Feet Us", "Square Miles", "Square Yard", "Square Millimeters", "Square Kilometers", "Hectares", "Acres", "Are"];
  static List<String> areaSymbols = ["m²", "cm²", "in²", "ft²", "mi²", "yd²", "mm²", "km²", "ha", "ac", "a"];

  static const _toSquareMeters = {
    AREA.squareMeters: 1.0,
    AREA.squareCentimeters: 0.0001,
    AREA.squareInches: 0.00064516,
    AREA.squareFeet: 0.092903,
    AREA.squareFeetUs: 0.092903,
    AREA.squareMiles: 2589988.110336,
    AREA.squareYard: 0.836127,
    AREA.squareMillimeters: 0.000001,
    AREA.squareKilometers: 1000000.0,
    AREA.hectares: 10000.0,
    AREA.acres: 4046.8564224,
    AREA.are: 100.0,
  };

  static const _fromSquareMeters = {
    AREA.squareMeters: 1.0,
    AREA.squareCentimeters: 10000.0,
    AREA.squareInches: 1550.0031,
    AREA.squareFeet: 10.7639,
    AREA.squareFeetUs: 10.7639,
    AREA.squareMiles: 0.000000386102,
    AREA.squareYard: 1.19599,
    AREA.squareMillimeters: 1000000.0,
    AREA.squareKilometers: 0.000001,
    AREA.hectares: 0.0001,
    AREA.acres: 0.000247105,
    AREA.are: 0.01,
  };

  static AREA getAreaEnum(int index) {
    return AREA.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getAreaEnum(from);
    var toEnum = getAreaEnum(to);

    var squareMeters = value * _toSquareMeters[fromEnum]!;

    if (_fromSquareMeters[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return squareMeters * _fromSquareMeters[toEnum]!;
  }
}
