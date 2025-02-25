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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text(
                widget.weatherData!.timezone,
                style: kTextStyle(30),
                ), 
              Text(widget.weatherData!.timezone_abbreviation),
              const SizedBox(height: 20),
              Text('${widget.weatherData!.current.temperature}°C', style: kTextStyle(50, isBold: true)),
              Text('Latitude: ${widget.weatherData!.latitude}\nLongitude: ${widget.weatherData!.longitude}'),
            ],
          ),
        ),
        ),
    );
  }
}