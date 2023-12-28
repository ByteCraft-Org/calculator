import 'package:calculator/properties/converter.dart';

enum TEMPERATURE {
  fahrenheit,
  celsius,
  kelvin,
  reamur,
  romer,
  delisle,
  rankine,
}

class TemperatureConverter implements Converter<int> {
  static List<String> temperatureName = ["Fahrenheit", "Celsius", "Kelvin", "Reamur", "Romer", "Delisle", "Rankine"];
  static List<String> temperatureSymbols = ["°F", "°C", "K", "°Re", "°Rø", "°De", "°R"];

  static final Map<TEMPERATURE, Function(dynamic value)> _toCelsius = <TEMPERATURE, Function(dynamic value)>{
    TEMPERATURE.fahrenheit: (value) => (value - 32) * (5 / 9),
    TEMPERATURE.celsius: (value) => value,
    TEMPERATURE.kelvin: (value) => value - 273.15,
    TEMPERATURE.reamur: (value) => value * (5 / 4),
    TEMPERATURE.romer: (value) => (value - 7.5) * (40 / 21),
    TEMPERATURE.delisle: (value) => 100 - value * (2 / 3),
    TEMPERATURE.rankine: (value) => (value - 491.67) * (5 / 9),
  };

  static final Map<TEMPERATURE, Function(dynamic value)> _fromCelsius = <TEMPERATURE, Function(dynamic value)>{
    TEMPERATURE.fahrenheit: (value) => value * (9 / 5) + 32,
    TEMPERATURE.celsius: (value) => value,
    TEMPERATURE.kelvin: (value) => value + 273.15,
    TEMPERATURE.reamur: (value) => value * (4 / 5),
    TEMPERATURE.romer: (value) => value * (21 / 40) + 7.5,
    TEMPERATURE.delisle: (value) => (100 - value) * (3 / 2),
    TEMPERATURE.rankine: (value) => value * (9 / 5) + 491.67,
  };

  static TEMPERATURE getTemperatureEnum(int index) {
    return TEMPERATURE.values[index];
  }

  @override
  double convert(double value, int from, int to) {
    var fromEnum = getTemperatureEnum(from);
    var toEnum = getTemperatureEnum(to);

    var celsiusValue = _toCelsius[fromEnum]!(value);

    if (_fromCelsius[toEnum] == null) {
      throw ArgumentError("Invalid conversion from $fromEnum to $toEnum");
    }

    return _fromCelsius[toEnum]!(celsiusValue);
  }
}
