import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  //double temp = 0;
  //bool isloading = false;
  late Future<Map<String, dynamic>> weather;

  //@override
  // void initState() {
  //   super.initState();
  //   getCurrentWeather();
  // }
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // setState(() {
      //   // bool isloading = true;
      // });
      String cityname = 'Delhi';
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&appid=$openwetherApiKey',
        ),
      );
      final data = jsonDecode(response.body);
      if (data['cod'] != '200') {
        throw data['message']; //'An error occured';
      }
      // setState(() {
      //   temp = data['list'][0]['main']['temp'];
      //   isloading = false;
      // });
      // data['list'][0]['main']['temp'];
      return data;
    } catch (e) {
      throw 'error'; //e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();//reinitialize weather here to active refresh button
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: //temp == 0
          //  isloading
          // ? const CircularProgressIndicator()
          FutureBuilder(
            future: weather,
            builder: (context, snapshot) {
              // print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              final data = snapshot.data!;
              final CurrentWeather = data['list'][0];
              final currentTemp = CurrentWeather['main']['temp'];
              final currentsky = CurrentWeather['weather'][0]['main'];
              final pressure = CurrentWeather['main']['pressure'];
              final Humidity = CurrentWeather['main']['humidity'];
              final windspeed = CurrentWeather['wind']['speed'];

              return Padding(
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
                                    '$currentTemp °K',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Icon(
                                    currentsky == 'Clouds' ||
                                            currentsky == 'Rain'
                                        ? Icons.cloud
                                        : Icons.sunny,
                                    size: 50,
                                    fill: 1,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    currentsky,
                                    style: TextStyle(fontSize: 20),
                                  ),
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
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       for (int i = 0; i < 5; i++) ...[
                    //         HourlyForcast(
                    //           time: data['list'][i + 1]['dt']
                    //               .toString(),
                    //           temperature: data['list'][i + 1]['main']['temp']
                    //               .toString(),
                    //           icon: data['list'][i + 1]['weather'][0]['main']=='Clouds'||data['list'][i + 1]['weather'][0]['main']=='Rain'?Icons.cloud:Icons.sunny,
                    //         ),
                    //       SizedBox(width: 5),]//for loop me [] list use karte hai

                    //       // HourlyForcast(
                    //       //   time: '12:00',
                    //       //   temprautre: '300.17',
                    //       //   icon: Icons.sunny,
                    //       // ),
                    //       // SizedBox(width: 5),
                    //       // HourlyForcast(
                    //       //   time: '15:00',
                    //       //   temprautre: '301.47',
                    //       //   icon: Icons.cloud,
                    //       // ),
                    //       // SizedBox(width: 5),
                    //       // HourlyForcast(
                    //       //   time: '18:00',
                    //       //   temprautre: '302.17',
                    //       //   icon: Icons.sunny,
                    //       // ),
                    //       // SizedBox(width: 5),
                    //       // HourlyForcast(
                    //       //   time: '21:00',
                    //       //   temprautre: '304.17',
                    //       //   icon: Icons.cloud,
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    //error because listview want fullscreen so to resolve it we will use
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (contextt, index) {
                          final time = DateTime.parse(
                            data['list'][index + 1]['dt_txt'],
                          );
                          return HourlyForcast(
                            time: DateFormat.j().format(time),
                            temperature: data['list'][index + 1]['main']['temp']
                                .toString(),
                            icon:
                                data['list'][index + 1]['weather'][0]['main'] ==
                                        'Clouds' ||
                                    data['list'][index +
                                            1]['weather'][0]['main'] ==
                                        'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    //extra information
                    Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Additionalinfo(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: Humidity.toString(),
                        ),
                        Additionalinfo(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: windspeed.toString(),
                        ),
                        Additionalinfo(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: pressure.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
