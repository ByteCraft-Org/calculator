enum SI_PREFIXES {
  base,
  deca,
  hecto,
  kilo,
  mega,
  giga,
  tera,
  peta,
  exa,
  zetta,
  yotta,
  deci,
  centi,
  milli,
  micro,
  nano,
  pico,
  femto,
  atto,
  zepto,
  yocto,
}

class SIPrefixConverter {
  static List<String> siPrefixesName = ["Base", "Deca", "Hecto", "Kilo", "Mega", "Giga", "Tera", "Peta", "Exa", "Zetta", "Yotta", "Deci", "Centi", "Milli", "Micro", "Nano", "Pico", "Femto", "Atto", "Zepto", "Yocto"];
  static List<String> siPrefixesSymbols = ["base", "da", "h", "k", "M", "G", "T", "P", "E", "Z", "Y", "d", "c", "m", "µ", "n", "p", "f", "a", "z", "y"];


  static const _toBase = {
    SI_PREFIXES.base: 1.0,
    SI_PREFIXES.deca: 10.0,
    SI_PREFIXES.hecto: 100.0,
    SI_PREFIXES.kilo: 1000.0,
    SI_PREFIXES.mega: 1000000.0,
    SI_PREFIXES.giga: 1000000000.0,
    SI_PREFIXES.tera: 1000000000000.0,
    SI_PREFIXES.peta: 1000000000000000.0,
    SI_PREFIXES.exa: 1000000000000000000.0,
    SI_PREFIXES.zetta: 1000000000000000000000.0,
    SI_PREFIXES.yotta: 1000000000000000000000000.0,
    SI_PREFIXES.deci: 0.1,
    SI_PREFIXES.centi: 0.01,
    SI_PREFIXES.milli: 0.001,
    SI_PREFIXES.micro: 0.000001,
    SI_PREFIXES.nano: 0.000000001,
    SI_PREFIXES.pico: 0.000000000001,
    SI_PREFIXES.femto: 0.000000000000001,
    SI_PREFIXES.atto: 0.000000000000000001,
    SI_PREFIXES.zepto: 0.000000000000000000001,
    SI_PREFIXES.yocto: 0.000000000000000000000001,
  };

  static const _fromBase = {
    SI_PREFIXES.base: 1.0,
    SI_PREFIXES.deca: 0.1,
    SI_PREFIXES.hecto: 0.01,
    SI_PREFIXES.kilo: 0.001,
    SI_PREFIXES.mega: 0.000001,
    SI_PREFIXES.giga: 0.000000001,
    SI_PREFIXES.tera: 0.000000000001,
    SI_PREFIXES.peta: 0.000000000000001,
    SI_PREFIXES.exa: 0.000000000000000001,
    SI_PREFIXES.zetta: 0.000000000000000000001,
    SI_PREFIXES.yotta: 0.000000000000000000000001,
    SI_PREFIXES.deci: 10.0,
    SI_PREFIXES.centi: 100.0,
    SI_PREFIXES.milli: 1000.0,
    SI_PREFIXES.micro: 1000000.0,
    SI_PREFIXES.nano: 1000000000.0,
    SI_PREFIXES.pico: 1000000000000.0,
    SI_PREFIXES.femto: 1000000000000000.0,
    SI_PREFIXES.atto: 1000000000000000000.0,
    SI_PREFIXES.zepto: 1000000000000000000000.0,
    SI_PREFIXES.yocto: 1000000000000000000000000.0,
  };

  static SI_PREFIXES getSIPrefixEnum(int index) {
    return SI_PREFIXES.values[index];
  }

  static double convert(double value, int from, int to) {
    var fromEnum = getSIPrefixEnum(from);
    var toEnum = getSIPrefixEnum(to);

    var baseValue = value * _toBase[fromEnum]!;

    if (_fromBase[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return baseValue * _fromBase[toEnum]!;
  }
}
