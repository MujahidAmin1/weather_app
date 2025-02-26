class WeatherData {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final HourlyUnits hourlyUnits;
  final Hourly hourly;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationtimeMs: json['generationtime_ms'],
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
      hourlyUnits: HourlyUnits.fromJson(json['hourly_units']),
      hourly: Hourly.fromJson(json['hourly']),
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
    );
  }
}

class Current {
  final String time;
  final int interval;
  final double temperature2m;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
    );
  }
}

class HourlyUnits {
  final String time;
  final String temperature2m;

  HourlyUnits({
    required this.time,
    required this.temperature2m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'],
      temperature2m: json['temperature_2m'],
    );
  }
}

class Hourly {
  final List<String> time;
  final List<double> temperature2m;

  Hourly({
    required this.time,
    required this.temperature2m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<String>.from(json['time']),
      temperature2m: List<double>.from(json['temperature_2m']),
    );
  }
}

class DailyUnits {
  final String time;
  final String weatherCode;

  DailyUnits({
    required this.time,
    required this.weatherCode,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'],
      weatherCode: json['weather_code'],
    );
  }
}

class Daily {
  final List<String> time;
  final List<int> weatherCode;

  Daily({
    required this.time,
    required this.weatherCode,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']),
      weatherCode: List<int>.from(json['weather_code']),
    );
  }
}
