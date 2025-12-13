import 'package:flutter/material.dart';

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({super.key});
  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetstate();
}

class _MyStateFulWidgetstate extends State<MyStateFulWidget> {
  late int abc;
  //here we are overriding initstate method to initialize abc because in stateful widget we cannot initialize variable directly
  //we use late keyword to tell dart that we will initialize this variable later before using it
  //we use override deribretely because we want to tell flutter we trying to make our own initfuntion 
  //super [point to parent class ]
  @override
  void initState() {
    super.initState();
    abc = 10;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Text(abc.toString()),
    )
    );
  }
}
