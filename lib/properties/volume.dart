enum VOLUME {
  cubicMeters,
  liters,
  imperialGallons,
  usGallons,
  imperialPints,
  usPints,
  milliliters,
  tablespoonsUs,
  australianTablespoons,
  cups,
  cubicCentimeters,
  cubicFeet,
  cubicInches,
  cubicMillimeters,
  imperialFluidOunces,
  usFluidOunces,
  imperialGill,
  usGill,
  usQuarts,
  femtoliters,
  picoliters,
  nanoliters,
  microliters,
  deciliters,
  centiliters,
}

class VolumeConverter {
  static List<String> volumeName = ["Cubic Meters", "Liters", "Imperial Gallons", "Us Gallons", "Imperial Pints", "Us Pints", "Milliliters", "Tablespoons Us", "Australian Tablespoons", "Cups", "Cubic Centimeters", "Cubic Feet", "Cubic Inches", "Cubic Millimeters", "Imperial Fluid Ounces", "Us Fluid Ounces", "Imperial Gill", "Us Gill", "Us Quarts", "Femtoliters", "Picoliters", "Nanoliters", "Microliters", "Deciliters", "Centiliters"];
  static List<String> volumeSymbols = ["m³", "L", "imp gal", "US gal", "imp pt", "US pt", "mL", "tbsp (US)", "tbsp (Australian)", "cups", "cm³", "ft³", "in³", "mm³", "imp fl oz", "US fl oz", "imp gill", "US gill", "US qt", "fL", "pL", "nL", "µL", "dL", "cL"];

  static const _toCubicMeters = {
    VOLUME.cubicMeters: 1.0,
    VOLUME.liters: 0.001,
    VOLUME.imperialGallons: 0.00454609,
    VOLUME.usGallons: 0.00378541,
    VOLUME.imperialPints: 0.568261,
    VOLUME.usPints: 0.473176,
    VOLUME.milliliters: 0.000001,
    VOLUME.tablespoonsUs: 0.0000147868,
    VOLUME.australianTablespoons: 0.000025,
    VOLUME.cups: 0.00025,
    VOLUME.cubicCentimeters: 0.000001,
    VOLUME.cubicFeet: 0.0283168,
    VOLUME.cubicInches: 0.0000163871,
    VOLUME.cubicMillimeters: 0.000000001,
    VOLUME.imperialFluidOunces: 0.0000284131,
    VOLUME.usFluidOunces: 0.0000295735,
    VOLUME.imperialGill: 0.142065,
    VOLUME.usGill: 0.118294,
    VOLUME.usQuarts: 0.000946353,
    VOLUME.femtoliters: 0.000000000000001,
    VOLUME.picoliters: 0.000000000001,
    VOLUME.nanoliters: 0.000000001,
    VOLUME.microliters: 0.000001,
    VOLUME.deciliters: 0.0001,
    VOLUME.centiliters: 0.00001,
  };

  static const _fromCubicMeters = {
    VOLUME.cubicMeters: 1.0,
    VOLUME.liters: 1000.0,
    VOLUME.imperialGallons: 219.969,
    VOLUME.usGallons: 264.172,
    VOLUME.imperialPints: 1.75975,
    VOLUME.usPints: 2.11338,
    VOLUME.milliliters: 1000000.0,
    VOLUME.tablespoonsUs: 67628.0454,
    VOLUME.australianTablespoons: 40000.0,
    VOLUME.cups: 4000.0,
    VOLUME.cubicCentimeters: 1000000.0,
    VOLUME.cubicFeet: 35.3147,
    VOLUME.cubicInches: 61023.7,
    VOLUME.cubicMillimeters: 1000000000.0,
    VOLUME.imperialFluidOunces: 35195.1,
    VOLUME.usFluidOunces: 33814.0,
    VOLUME.imperialGill: 7.04114,
    VOLUME.usGill: 8.45351,
    VOLUME.usQuarts: 1056.69,
    VOLUME.femtoliters: 1000000000000000.0,
    VOLUME.picoliters: 1000000000000.0,
    VOLUME.nanoliters: 1000000000.0,
    VOLUME.microliters: 1000000.0,
    VOLUME.deciliters: 10000.0,
    VOLUME.centiliters: 100000.0,
  };

  static VOLUME getVolumeEnum(int index) {
    return VOLUME.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getVolumeEnum(from);
    var toEnum = getVolumeEnum(to);

    if (_toCubicMeters[fromEnum] == null || _fromCubicMeters[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return value * _toCubicMeters[fromEnum]! * _fromCubicMeters[toEnum]!;
  }
}
