enum MOLAR_VOLUME {
  molesPerLiter,
  molesPerMilliliter,
  molesPerCubicMeter,
  millimolesPerLiter,
  millimolesPerDeciliter,
  micromolesPerLiter,
  micromolesPerDeciliter,
  micromolesPerMilliliter,
  nanomolesPerLiter,
  nanomolesPerDeciliter,
  nanomolesPerMilliliter,
  picomolesPerLiter,
  picomolesPerDeciliter,
  picomolesPerMilliliter,
  femtomolesPerMilliliter,
}

class MolarVolumeConverter {
  static List<String> molarVolumeName = ["Moles Per Liter", "Moles Per Milliliter", "Moles Per Cubic Meter", "Millimoles Per Liter", "Millimoles Per Deciliter", "Micromoles Per Liter", "Micromoles Per Deciliter", "Micromoles Per Milliliter", "Nanomoles Per Liter", "Nanomoles Per Deciliter", "Nanomoles Per Milliliter", "Picomoles Per Liter", "Picomoles Per Deciliter", "Picomoles Per Milliliter", "Femtomoles Per Milliliter"];
  static List<String> molarVolumeSymbols = ["mol/l", "mol/ml", "mol/m³", "mmol/l", "mmol/dl", "µmol/l", "µmol/dl", "µmol/ml", "nmol/l", "nmol/dl", "nl/ml", "pmol/l", "pmol/dl", "pmol/ml", "fmol/ml"];

  static const _toMolesPerLiter = {
    MOLAR_VOLUME.molesPerLiter: 1.0,
    MOLAR_VOLUME.molesPerMilliliter: 1000.0,
    MOLAR_VOLUME.molesPerCubicMeter: 1.0,
    MOLAR_VOLUME.millimolesPerLiter: 0.001,
    MOLAR_VOLUME.millimolesPerDeciliter: 0.0001,
    MOLAR_VOLUME.micromolesPerLiter: 0.000001,
    MOLAR_VOLUME.micromolesPerDeciliter: 0.0000001,
    MOLAR_VOLUME.micromolesPerMilliliter: 0.001,
    MOLAR_VOLUME.nanomolesPerLiter: 0.000000001,
    MOLAR_VOLUME.nanomolesPerDeciliter: 0.0000000001,
    MOLAR_VOLUME.nanomolesPerMilliliter: 0.000000001,
    MOLAR_VOLUME.picomolesPerLiter: 0.000000000001,
    MOLAR_VOLUME.picomolesPerDeciliter: 0.0000000000001,
    MOLAR_VOLUME.picomolesPerMilliliter: 0.000000000001,
    MOLAR_VOLUME.femtomolesPerMilliliter: 0.000000000000001,
  };

  static const _fromMolesPerLiter = {
    MOLAR_VOLUME.molesPerLiter: 1.0,
    MOLAR_VOLUME.molesPerMilliliter: 0.001,
    MOLAR_VOLUME.molesPerCubicMeter: 1.0,
    MOLAR_VOLUME.millimolesPerLiter: 1000.0,
    MOLAR_VOLUME.millimolesPerDeciliter: 10000.0,
    MOLAR_VOLUME.micromolesPerLiter: 1000000.0,
    MOLAR_VOLUME.micromolesPerDeciliter: 10000000.0,
    MOLAR_VOLUME.micromolesPerMilliliter: 1000.0,
    MOLAR_VOLUME.nanomolesPerLiter: 1000000000.0,
    MOLAR_VOLUME.nanomolesPerDeciliter: 10000000000.0,
    MOLAR_VOLUME.nanomolesPerMilliliter: 1000000000.0,
    MOLAR_VOLUME.picomolesPerLiter: 1000000000000.0,
    MOLAR_VOLUME.picomolesPerDeciliter: 10000000000000.0,
    MOLAR_VOLUME.picomolesPerMilliliter: 1000000000000.0,
    MOLAR_VOLUME.femtomolesPerMilliliter: 1000000000000000.0,
  };

  static MOLAR_VOLUME getMolarVolumeEnum(int index) {
    return MOLAR_VOLUME.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getMolarVolumeEnum(from);
    var toEnum = getMolarVolumeEnum(to);

    var molesPerLiter = value * _toMolesPerLiter[fromEnum]!;

    if (_fromMolesPerLiter[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return molesPerLiter * _fromMolesPerLiter[toEnum]!;
  }
}
