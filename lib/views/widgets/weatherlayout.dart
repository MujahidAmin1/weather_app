import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/kTextStyle.dart';

class WeatherLayout extends StatefulWidget {
  WeatherData? weatherData;
  WeatherLayout({super.key, this.weatherData});

  @override
  State<WeatherLayout> createState() => _WeatherLayoutState();
}

class _WeatherLayoutState extends State<WeatherLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.weatherData!.daily.weatherCode
                    .any((code) => [61, 63, 65].contains(code)) // Rain
                ? [
                    Color(0xFFA2A9D9),
                    Color(0xFF373B47)
                  ] // Light Rain / Moderate Rain / Heavy Rain
                : widget.weatherData!.daily.weatherCode.contains(0) // Clear
                    ? [Color(0xFF6BC8FA), Color(0xFF2887E5)] // Clear Sky
                    : widget.weatherData!.daily.weatherCode.any(
                            (code) => [71, 73, 75].contains(code)) // Snowfall
                        ? [
                            Color(0xFF6BC8FA),
                            Color(0xFF2887E5)
                          ] // Light Snow / Moderate Snow / Heavy Snow
                        : widget.weatherData!.daily.weatherCode.any((code) =>
                                [80, 81, 82].contains(code)) // Rain showers
                            ? [
                                Color(0xFF6BC8FA),
                                Color(0xFF2887E5)
                              ] // Rain Showers
                            : [Colors.black, Colors.blue], // Default case
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Text(
                  widget.weatherData!.timezone,
                  style: kTextStyle(30),
                ),
                Text(widget.weatherData!.timezoneAbbreviation),
                const SizedBox(height: 20),
                Image.asset('assets/Snowy.png'),
                Text('${widget.weatherData!.current.temperature2m}°C',
                    style: kTextStyle(50, isBold: true)),
                Text(
                    'Latitude: ${widget.weatherData!.latitude}\nLongitude: ${widget.weatherData!.longitude}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
