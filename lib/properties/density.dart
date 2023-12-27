enum DENSITY {
  gramsPerLiter,
  gramsPerCubicCentimeter,
  gramsPerMilliliter,
  gramsPerDeciliter,
  kilogramsPerLiter,
  kilogramsPerCubicMeter,
  milligramsPerLiter,
  milligramsPerDeciliter,
  milligramsPerMilliliter,
  milligramsPerCubicMeter,
  milligramsPerCubicCentimeter,
  microgramsPerLiter,
  microgramsPerDeciliter,
  microgramsPerMilliliter,
  nanogramsPerLiter,
  nanogramsPerMilliliter,
  picogramsPerLiter,
  picogramsPerMilliliter
}

class DensityConverter {
  static List<String> densityName = ["Grams Per Liter", "Grams Per Cubic Centimeter", "Grams Per Milliliter", "Grams Per Deciliter", "Kilograms Per Liter", "Kilograms Per Cubic Meter", "Milligrams Per Liter", "Milligrams Per Deciliter", "Milligrams Per Milliliter", "Milligrams Per Cubic Meter", "Milligrams Per Cubic Centimeter", "Micrograms Per Liter", "Micrograms Per Deciliter", "Micrograms Per Milliliter", "Nanograms Per Liter", "Nanograms Per Milliliter", "Picograms Per Liter", "Picograms Per Milliliter"];
  static List<String> densitySymbols = ["g/l", "g/cm³", "g/ml", "g/dl", "kg/l", "kg/m³", "mg/l", "mg/dl", "mg/ml", "mg/m³", "mg/cm³", "µg/l", "µg/dl", "µg/ml", "ng/l", "ng/ml", "pg/l", "pg/ml"];

  static const _toGramsPerLiter = {
    DENSITY.gramsPerLiter: 1.0,
    DENSITY.gramsPerCubicCentimeter: 1000.0,
    DENSITY.gramsPerMilliliter: 1.0,
    DENSITY.gramsPerDeciliter: 0.1,
    DENSITY.kilogramsPerLiter: 1000.0,
    DENSITY.kilogramsPerCubicMeter: 0.001,
    DENSITY.milligramsPerLiter: 0.001,
    DENSITY.milligramsPerDeciliter: 0.0001,
    DENSITY.milligramsPerMilliliter: 1.0,
    DENSITY.milligramsPerCubicMeter: 0.000001,
    DENSITY.milligramsPerCubicCentimeter: 1.0,
    DENSITY.microgramsPerLiter: 0.000001,
    DENSITY.microgramsPerDeciliter: 0.00000001,
    DENSITY.microgramsPerMilliliter: 0.001,
    DENSITY.nanogramsPerLiter: 0.000000001,
    DENSITY.nanogramsPerMilliliter: 0.000001,
    DENSITY.picogramsPerLiter: 0.000000000001,
    DENSITY.picogramsPerMilliliter: 0.000000001,
  };

  static const _fromGramsPerLiter = {
    DENSITY.gramsPerLiter: 1.0,
    DENSITY.gramsPerCubicCentimeter: 0.001,
    DENSITY.gramsPerMilliliter: 1.0,
    DENSITY.gramsPerDeciliter: 10.0,
    DENSITY.kilogramsPerLiter: 0.001,
    DENSITY.kilogramsPerCubicMeter: 1000.0,
    DENSITY.milligramsPerLiter: 1000.0,
    DENSITY.milligramsPerDeciliter: 10000.0,
    DENSITY.milligramsPerMilliliter: 1.0,
    DENSITY.milligramsPerCubicMeter: 1000000.0,
    DENSITY.milligramsPerCubicCentimeter: 1.0,
    DENSITY.microgramsPerLiter: 1000000.0,
    DENSITY.microgramsPerDeciliter: 10000000.0,
    DENSITY.microgramsPerMilliliter: 1000.0,
    DENSITY.nanogramsPerLiter: 1000000000.0,
    DENSITY.nanogramsPerMilliliter: 1000000.0,
    DENSITY.picogramsPerLiter: 1000000000000.0,
    DENSITY.picogramsPerMilliliter: 1000000000.0,
  };

  static DENSITY getDensityEnum(int index) {
    return DENSITY.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getDensityEnum(from);
    var toEnum = getDensityEnum(to);

    var gramsPerLiter = value * _toGramsPerLiter[fromEnum]!;

    if (_fromGramsPerLiter[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return gramsPerLiter * _fromGramsPerLiter[toEnum]!;
  }
}
