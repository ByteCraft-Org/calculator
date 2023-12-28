import 'package:calculator/properties/converter.dart';

enum DIGITAL_DATA {
  bit,
  nibble,
  kilobit,
  megabit,
  gigabit,
  terabit,
  petabit,
  exabit,
  kibibit,
  mebibit,
  gibibit,
  tebibit,
  pebibit,
  exbibit,
  byte,
  kilobyte,
  megabyte,
  gigabyte,
  terabyte,
  petabyte,
  exabyte,
  kibibyte,
  mebibyte,
  gibibyte,
  tebibyte,
  pebibyte,
  exbibyte,
}

class DigitalDataConverter implements Converter<int> {
  static List<String> digitalDataName = ["Bit", "Nibble", "Kilobit", "Megabit", "Gigabit", "Terabit", "Petabit", "Exabit", "Kibibit", "Mebibit", "Gibibit", "Tebibit", "Pebibit", "Exbibit", "Byte", "Kilobyte", "Megabyte", "Gigabyte", "Terabyte", "Petabyte", "Exabyte", "Kibibyte", "Mebibyte", "Gibibyte", "Tebibyte", "Pebibyte", "Exbibyte"];
  static List<String> digitalDataSymbols = ["b", "Nibble", "kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Kibit", "Mibit", "Gibit", "Tibit", "Pibit", "Eibit", "B", "kB", "MB", "GB", "TB", "PB", "EB", "KiB", "MiB", "GiB", "TiB", "PiB", "Eibyte"];

  static const _toBits = {
    DIGITAL_DATA.bit: 1.0,
    DIGITAL_DATA.nibble: 4.0,
    DIGITAL_DATA.kilobit: 1000.0,
    DIGITAL_DATA.megabit: 1000000.0,
    DIGITAL_DATA.gigabit: 1000000000.0,
    DIGITAL_DATA.terabit: 1000000000000.0,
    DIGITAL_DATA.petabit: 1000000000000000.0,
    DIGITAL_DATA.exabit: 1000000000000000000.0,
    DIGITAL_DATA.kibibit: 1024.0,
    DIGITAL_DATA.mebibit: 1048576.0,
    DIGITAL_DATA.gibibit: 1073741824.0,
    DIGITAL_DATA.tebibit: 1099511627776.0,
    DIGITAL_DATA.pebibit: 1125899906842624.0,
    DIGITAL_DATA.exbibit: 1152921504606846976.0,
    DIGITAL_DATA.byte: 8.0,
    DIGITAL_DATA.kilobyte: 8192.0,
    DIGITAL_DATA.megabyte: 8388608.0,
    DIGITAL_DATA.gigabyte: 8589934592.0,
    DIGITAL_DATA.terabyte: 8796093022208.0,
    DIGITAL_DATA.petabyte: 9007199254740992.0,
    DIGITAL_DATA.exabyte: 9223372036854775808.0,
    DIGITAL_DATA.kibibyte: 8192.0,
    DIGITAL_DATA.mebibyte: 8388608.0,
    DIGITAL_DATA.gibibyte: 8589934592.0,
    DIGITAL_DATA.tebibyte: 8796093022208.0,
    DIGITAL_DATA.pebibyte: 9007199254740992.0,
    DIGITAL_DATA.exbibyte: 9223372036854775808.0,
  };

  static const _fromBits = {
    DIGITAL_DATA.bit: 1.0,
    DIGITAL_DATA.nibble: 0.25,
    DIGITAL_DATA.kilobit: 0.001,
    DIGITAL_DATA.megabit: 0.000001,
    DIGITAL_DATA.gigabit: 0.000000001,
    DIGITAL_DATA.terabit: 0.000000000001,
    DIGITAL_DATA.petabit: 0.000000000000001,
    DIGITAL_DATA.exabit: 0.000000000000000001,
    DIGITAL_DATA.kibibit: 0.000976563,
    DIGITAL_DATA.mebibit: 0.000000953674,
    DIGITAL_DATA.gibibit: 0.000000000931323,
    DIGITAL_DATA.tebibit: 0.000000000000909495,
    DIGITAL_DATA.pebibit: 0.000000000000000888178,
    DIGITAL_DATA.exbibit: 0.000000000000000000867362,
    DIGITAL_DATA.byte: 0.125,
    DIGITAL_DATA.kilobyte: 0.00012207,
    DIGITAL_DATA.megabyte: 0.00011921,
    DIGITAL_DATA.gigabyte: 0.00011641,
    DIGITAL_DATA.terabyte: 0.00011369,
    DIGITAL_DATA.petabyte: 0.00011102,
    DIGITAL_DATA.exabyte: 0.00010842,
    DIGITAL_DATA.kibibyte: 0.000976563,
    DIGITAL_DATA.mebibyte: 0.000953674,
    DIGITAL_DATA.gibibyte: 0.000931323,
    DIGITAL_DATA.tebibyte: 0.000909495,
    DIGITAL_DATA.pebibyte: 0.000888178,
    DIGITAL_DATA.exbibyte: 0.000867362,
  };

  static DIGITAL_DATA getDigitalDataEnum(int index) {
    return DIGITAL_DATA.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getDigitalDataEnum(from);
    var toEnum = getDigitalDataEnum(to);

    var bits = value * _toBits[fromEnum]!;

    if (_fromBits[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return bits * _fromBits[toEnum]!;
  }
}
