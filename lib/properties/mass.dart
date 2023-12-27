enum MASS {
  grams,
  ettograms,
  kilograms,
  pounds,
  ounces,
  quintals,
  tons,
  milligrams,
  femtograms,
  picograms,
  nanograms,
  micrograms,
  decigrams,
  carats,
  centigrams,
  pennyweights,
  troyOunces,
  stones,
}

class MassConverter {
  static List<String> massName = ["Grams", "Ettograms", "Kilograms", "Pounds", "Ounces", "Quintals", "Tons", "Milligrams", "Femtograms", "Picograms", "Nanograms", "Micrograms", "Decigrams", "Uma", "Carats", "Centigrams", "Pennyweights", "Troy Ounces", "Stones"];
  static List<String> massSymbols = ["g", "hg", "kg", "lb", "oz", "q", "t", "mg", "fg", "pg", "ng", "µg", "dg", "u", "ct", "cg", "dwt", "oz t", "st."];

  static const _toGrams = {
    MASS.grams: 1.0,
    MASS.ettograms: 100.0,
    MASS.kilograms: 1000.0,
    MASS.pounds: 453.592,
    MASS.ounces: 28.3495,
    MASS.quintals: 100000.0,
    MASS.tons: 1000000.0,
    MASS.milligrams: 0.001,
    MASS.femtograms: 1.0 / 1000000000000000,
    MASS.picograms: 1.0 / 1000000000000,
    MASS.nanograms: 1.0 / 1000000000,
    MASS.micrograms: 1.0 / 1000000,
    MASS.decigrams: 0.1,
    MASS.carats: 0.2,
    MASS.centigrams: 0.01,
    MASS.pennyweights: 1.55517,
    MASS.troyOunces: 31.1035,
    MASS.stones: 6350.29,
  };

  static const _fromGrams = {
    MASS.grams: 1.0,
    MASS.ettograms: 0.01,
    MASS.kilograms: 0.001,
    MASS.pounds: 0.00220462,
    MASS.ounces: 0.03527396,
    MASS.quintals: 0.00001,
    MASS.tons: 1.0 / 1000000,
    MASS.milligrams: 1000.0,
    MASS.femtograms: 1.0 / 1000000000000000,
    MASS.picograms: 1.0 / 1000000000000,
    MASS.nanograms: 1.0 / 1000000000,
    MASS.micrograms: 1.0 / 1000000,
    MASS.decigrams: 10.0,
    MASS.carats: 5.0,
    MASS.centigrams: 100.0,
    MASS.pennyweights: 0.6430149,
    MASS.troyOunces: 0.0321507,
    MASS.stones: 0.000157473,
  };

  static MASS getMassEnum(int index) {
    return MASS.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getMassEnum(from);
    var toEnum = getMassEnum(to);

    var grams = value * _toGrams[fromEnum]!;

    if (_fromGrams[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return grams * _fromGrams[toEnum]!;
  }
}
