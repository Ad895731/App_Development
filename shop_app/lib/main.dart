import 'package:flutter/material.dart';
import 'package:shop_app/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Shoping App', home: HomePage());
  }
}
