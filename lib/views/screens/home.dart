import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/services/api-service.dart';
import 'package:weather_app/views/widgets/weatherlayout.dart';

import '../../models/weather.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<WeatherData>> futureWeatherData;
  Timer? _timer;
  @override
  void initState(){
    futureWeatherData = ApiService();
    _timer = Timer.periodic(const Duration(seconds: 30), (t) { 
      futureWeatherData;
    });
    super.initState();
  }
  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: futureWeatherData, 
        builder: (context, snapshot){
         if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          }
          final weatherList = snapshot.data!;
          return PageView.builder(
            itemCount: weatherList.length,
            itemBuilder: (context, index){
              return WeatherLayout(
                weatherData: weatherList[index],
              );
            }
            );
        },
        )
      ); 
  }
}
