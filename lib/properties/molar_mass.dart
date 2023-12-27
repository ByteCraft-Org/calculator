enum MOLAR_MASS {
  gramsPerMole,
  gramsPerMillimole,
  gramsPerMicromole,
  gramsPerNanomole,
  gramsPerPicomole,
  gramsPerFemtomole,
  milligramsPerMole,
  milligramsPerMillimole,
  milligramsPerMicromole,
  milligramsPerNanomole,
  milligramsPerPicomole,
  milligramsPerFemtomole,
  kilogramsPerMole,
  kilogramsPerMillimole,
}

class MolarMassConverter {
  static List<String> molarMassName = ["Grams Per Mole", "Grams Per Millimole", "Grams Per Micromole", "Grams Per Nanomole", "Grams Per Picomole", "Grams Per Femtomole", "Milligrams Per Mole", "Milligrams Per Millimole", "Milligrams Per Micromole", "Milligrams Per Nanomole", "Milligrams Per Picomole", "Milligrams Per Femtomole", "Kilograms Per Mole", "Kilograms Per Millimole"];
  static List<String> molarMassSymbols = ["g/mol", "g/mmol", "g/µmol", "g/nmol", "g/pmol", "g/fmol", "mg/mol", "mg/mmol", "kg/mol", "kg/mmol"];

  static const _toGramsPerMole = {
    MOLAR_MASS.gramsPerMole: 1.0,
    MOLAR_MASS.gramsPerMillimole: 0.001,
    MOLAR_MASS.gramsPerMicromole: 0.000001,
    MOLAR_MASS.gramsPerNanomole: 0.000000001,
    MOLAR_MASS.gramsPerPicomole: 0.000000000001,
    MOLAR_MASS.gramsPerFemtomole: 0.000000000000001,
    MOLAR_MASS.milligramsPerMole: 1000.0,
    MOLAR_MASS.milligramsPerMillimole: 1.0,
    MOLAR_MASS.milligramsPerMicromole: 0.001,
    MOLAR_MASS.milligramsPerNanomole: 0.000001,
    MOLAR_MASS.milligramsPerPicomole: 0.000000001,
    MOLAR_MASS.milligramsPerFemtomole: 0.000000000001,
    MOLAR_MASS.kilogramsPerMole: 0.001,
    MOLAR_MASS.kilogramsPerMillimole: 0.000001,
  };

  static const _fromGramsPerMole = {
    MOLAR_MASS.gramsPerMole: 1.0,
    MOLAR_MASS.gramsPerMillimole: 1000.0,
    MOLAR_MASS.gramsPerMicromole: 1000000.0,
    MOLAR_MASS.gramsPerNanomole: 1000000000.0,
    MOLAR_MASS.gramsPerPicomole: 1000000000000.0,
    MOLAR_MASS.gramsPerFemtomole: 1000000000000000.0,
    MOLAR_MASS.milligramsPerMole: 0.001,
    MOLAR_MASS.milligramsPerMillimole: 1.0,
    MOLAR_MASS.milligramsPerMicromole: 1000.0,
    MOLAR_MASS.milligramsPerNanomole: 1000000.0,
    MOLAR_MASS.milligramsPerPicomole: 1000000000.0,
    MOLAR_MASS.milligramsPerFemtomole: 1000000000000.0,
    MOLAR_MASS.kilogramsPerMole: 1000.0,
    MOLAR_MASS.kilogramsPerMillimole: 1000000.0,
  };

  static MOLAR_MASS getMolarMassEnum(int index) {
    return MOLAR_MASS.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getMolarMassEnum(from);
    var toEnum = getMolarMassEnum(to);

    var gramsPerMole = value * _toGramsPerMole[fromEnum]!;

    if (_fromGramsPerMole[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return gramsPerMole * _fromGramsPerMole[toEnum]!;
  }
}
