import 'package:calculator/properties/converter.dart';

enum AMOUNT_OF_SUBSTANCE {
  moles,
  millimoles,
  micromoles,
  nanomoles,
  picomoles,
  femtomoles,
}

class AmountOfSubstanceConverter implements Converter<int> {
  static List<String> amountOfSubstanceName = ["Moles", "Millimoles", "Micromoles", "Nanomoles", "Picomoles", "Femtomoles"];
  static List<String> amountOfSubstanceSymbols = ["mol", "mmol", "µmol", "nmol", "pmol", "fmol"];

  static const _toMoles = {
    AMOUNT_OF_SUBSTANCE.moles: 1.0,
    AMOUNT_OF_SUBSTANCE.millimoles: 0.001,
    AMOUNT_OF_SUBSTANCE.micromoles: 0.000001,
    AMOUNT_OF_SUBSTANCE.nanomoles: 0.000000001,
    AMOUNT_OF_SUBSTANCE.picomoles: 0.000000000001,
    AMOUNT_OF_SUBSTANCE.femtomoles: 0.000000000000001,
  };

  static const _fromMoles = {
    AMOUNT_OF_SUBSTANCE.moles: 1.0,
    AMOUNT_OF_SUBSTANCE.millimoles: 1000.0,
    AMOUNT_OF_SUBSTANCE.micromoles: 1000000.0,
    AMOUNT_OF_SUBSTANCE.nanomoles: 1000000000.0,
    AMOUNT_OF_SUBSTANCE.picomoles: 1000000000000.0,
    AMOUNT_OF_SUBSTANCE.femtomoles: 1000000000000000.0,
  };

  static AMOUNT_OF_SUBSTANCE getAmountOfSubstanceEnum(int index) {
    return AMOUNT_OF_SUBSTANCE.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getAmountOfSubstanceEnum(from);
    var toEnum = getAmountOfSubstanceEnum(to);

    var moles = value * _toMoles[fromEnum]!;

    if (_fromMoles[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return moles * _fromMoles[toEnum]!;
  }
}
