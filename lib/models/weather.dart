import 'dart:convert';

class WeatherData {
  final double latitude;
  final double longitude;
  final String timezone;
  final String timezone_abbreviation;
  final double elevation;
  final CurrentWeather current;
  final HourlyWeather hourly;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezone_abbreviation,
    required this.elevation,
    required this.current,
    required this.hourly,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      latitude: json["latitude"],
      longitude: json["longitude"],
      timezone: json["timezone"],
      timezone_abbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      current: CurrentWeather.fromJson(json["current"]),
      hourly: HourlyWeather.fromJson(json["hourly"]),
    );
  }
}

class CurrentWeather {
  final String time;
  final double temperature;

  CurrentWeather({
    required this.time,
    required this.temperature,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json["time"],
      temperature: json["temperature_2m"].toDouble(),
    );
  }
}

class HourlyWeather {
  final List<String> time;
  final List<double> temperatures;

  HourlyWeather({
    required this.time,
    required this.temperatures,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: List<String>.from(json["time"]),
      temperatures: List<double>.from(json["temperature_2m"].map((x) => x.toDouble())),
    );
  }
}
