enum NUMERAL_SYSTEMS {
  decimal,
  hexadecimal,
  octal,
  binary,
}

class NumeralConverter {
  static List<String> numeralSystemsName = ["Decimal", "Hexadecimal", "Octal", "Binary"];
  static List<String> numeralSystemsSymbols = ["₁₀", "₁₆", "₈", "₂"];


  static const _binaryBase = 2;
  static const _octalBase = 8;
  static const _hexadecimalBase = 16;

  static String convert(String value, NUMERAL_SYSTEMS from, NUMERAL_SYSTEMS to) {
    int decimalValue;

    switch (from) {
      case NUMERAL_SYSTEMS.decimal:
        decimalValue = int.parse(value);
        break;
      case NUMERAL_SYSTEMS.binary:
        decimalValue = int.parse(value, radix: _binaryBase);
        break;
      case NUMERAL_SYSTEMS.octal:
        decimalValue = int.parse(value, radix: _octalBase);
        break;
      case NUMERAL_SYSTEMS.hexadecimal:
        decimalValue = int.parse(value, radix: _hexadecimalBase);
        break;
    }

    String result;

    switch (to) {
      case NUMERAL_SYSTEMS.decimal:
        result = decimalValue.toString();
        break;
      case NUMERAL_SYSTEMS.binary:
        result = decimalValue.toRadixString(_binaryBase);
        break;
      case NUMERAL_SYSTEMS.octal:
        result = decimalValue.toRadixString(_octalBase);
        break;
      case NUMERAL_SYSTEMS.hexadecimal:
        result = decimalValue.toRadixString(_hexadecimalBase);
        break;
    }

    return result;
  }
}
