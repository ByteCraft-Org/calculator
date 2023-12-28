import 'package:calculator/properties/converter.dart';

enum NUMERAL_SYSTEMS {
  decimal,
  hexadecimal,
  octal,
  binary,
}

class NumeralSystemsConverter implements Converter<int> {
  static List<String> numeralSystemsName = ["Decimal", "Hexadecimal", "Octal", "Binary"];
  static List<String> numeralSystemsSymbols = ["₁₀", "₁₆", "₈", "₂"];

  static const _binaryBase = 2;
  static const _octalBase = 8;
  static const _hexadecimalBase = 16;

  @override
  double convert(double value, int from, int to) {
    int decimalValue = 0;

    switch (from) {
      case 0: // NUMERAL_SYSTEMS.decimal
        decimalValue = int.parse(value.toString());
        break;
      case 1: // NUMERAL_SYSTEMS.binary
        decimalValue = int.parse(value.toString(), radix: _binaryBase);
        break;
      case 2: // NUMERAL_SYSTEMS.octal
        decimalValue = int.parse(value.toString(), radix: _octalBase);
        break;
      case 3: // NUMERAL_SYSTEMS.hexadecimal
        decimalValue = int.parse(value.toString(), radix: _hexadecimalBase);
        break;
    }

    switch (to) {
      case 0: // NUMERAL_SYSTEMS.decimal
        return decimalValue.toDouble();
      case 1: // NUMERAL_SYSTEMS.binary
        return int.parse(decimalValue.toRadixString(_binaryBase)).toDouble();
      case 2: // NUMERAL_SYSTEMS.octal
        return int.parse(decimalValue.toRadixString(_octalBase)).toDouble();
      case 3: // NUMERAL_SYSTEMS.hexadecimal
        return int.parse(decimalValue.toRadixString(_hexadecimalBase)).toDouble();
      default:
        return 0;
    }
  }
}
