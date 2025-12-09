import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Additional_info.dart';
import 'package:weather_app/hourly_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    String cityname = 'London';
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$openwetherApiKey&units=metric',
      ),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //for splash
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color.fromARGB(89, 100, 93, 115),
                elevation: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300 °K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.cloud, size: 50, fill: 1),
                          SizedBox(height: 10),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //weather forcast
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForcast(
                    time: '09:00',
                    temprautre: '301.17',
                    icon: Icons.cloud,
                  ),
                  SizedBox(width: 5),
                  HourlyForcast(
                    time: '12:00',
                    temprautre: '300.17',
                    icon: Icons.sunny,
                  ),
                  SizedBox(width: 5),
                  HourlyForcast(
                    time: '15:00',
                    temprautre: '301.47',
                    icon: Icons.cloud,
                  ),
                  SizedBox(width: 5),
                  HourlyForcast(
                    time: '18:00',
                    temprautre: '302.17',
                    icon: Icons.sunny,
                  ),
                  SizedBox(width: 5),
                  HourlyForcast(
                    time: '21:00',
                    temprautre: '304.17',
                    icon: Icons.cloud,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //extra information
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Additionalinfo(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91',
                ),
                Additionalinfo(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.17',
                ),
                Additionalinfo(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1000',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
