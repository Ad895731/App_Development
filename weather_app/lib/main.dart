import 'package:flutter/material.dart';
import 'package:weather_app/Weather_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to escape debug in screen
      debugShowCheckedModeBanner: false,
      //theme will be used for every screen not only for one screenlike Scaffold
      theme: ThemeData.dark(useMaterial3: true),
      home: const WeatherScreen(),
    );
  }
}
