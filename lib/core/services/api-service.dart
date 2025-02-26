import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/weather.dart';


Future<List<WeatherData>> ApiService() async {
  const String url = "https://api.open-meteo.com/v1/forecast?latitude=9.0575,40.7128,51.5074,48.8566,35.6762&longitude=7.4951,-74.006,-0.1278,2.3522,139.6503&current=temperature_2m&hourly=temperature_2m&daily=weather_code&timezone=Africa%2FLagos,America%2FNew_York,Europe%2FLondon,Europe%2FParis,Asia%2FTokyo";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200){
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((data) => WeatherData.fromJson(data)).toList();
    
  } else {
    throw Exception("Failed to load weather data");
  }

}