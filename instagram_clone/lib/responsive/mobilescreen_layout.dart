import 'package:flutter/material.dart';

class MobilescreenLayout extends StatelessWidget {
  // here it is constructor of MobilescreenLayout class and it is used to create an object of MobilescreenLayout class
  //super.key is used to pass the key to the parent class StatelessWidget , super.key is a named parameter of StatelessWidget class that is used to identify the widget in the widget tree and it is optional
  const MobilescreenLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [Text('Mobile Screen Layout')])),
    );
  }
}
