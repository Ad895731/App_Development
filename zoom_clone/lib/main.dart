import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      // ThemeData.dark() creates a pre-configured dark theme with dark backgrounds and light text
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // Routes: Map of string names to widget builders for navigation
      // Key: route name (string), Value: function that returns a widget
      // Usage: Navigator.pushNamed(context, '/login') to navigate
      routes:{
        '/login':(context) => const Loginscreen(), // When '/login' is called, return Loginscreen widget
        //'/home':(context) => const HomeScreen(), // Example: another route
      } ,
      home: Loginscreen(),
    );
  }
}
