import 'package:flutter/material.dart';

class WebscreenLayout extends StatelessWidget {
  const WebscreenLayout({super.key});
  //here @override means we are overriding the build method of StatelessWidget class
  @override
  //widget here is the return type of build method
  //build here is a method that takes BuildContext as parameter
  //build method describes the part of the user interface represented by this widget
  //BuildContext means the location of a widget in the widget tree
  //context here is an object that holds the location of this widget in the widget tree
  //difference between context and BuildContext is that context is an instance of BuildContext and BuildContext is a class and context is a variable
  Widget build(BuildContext context) {
    //Scaffold is a class that provides a framework which implements the basic material design visual layout structure of the flutter app
    return Scaffold(
      //It is necessary to have body property in Scaffold class. why? because body property is used to define the main content of the screen
      body: Center(child: Column(children: [Text('Web Screen Layout')])),
    );
  }
}
