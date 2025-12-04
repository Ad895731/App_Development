//impoRted currency...
// import 'package:currency_converter/pages/currency_converter_materialapp.dart';
//Realtive importing
import 'currency_converter_materialapp.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart'; for apple design

//here material.dart is impoted which help to use keyword like runApp
//widget:- an abstract class that describe how my interface should look like
void main() {
  //we remove text and added my app because now we can make change in myapp abstsract class which break app in small part and easy to manage
  // we use const because myapp is stateless widget and its data will not change
  runApp(const MyApp());
}

//Types of widgets
//state:- they are are shown at the interface
// 1. StatelessWidget: data that decide how screen should look like , in this data does not change at all
//2.  StatefulWidget:- in this state(data) can change during runtime
// 3. InhertedWidget
//9:00:00
class MyApp extends StatelessWidget {
  // now after creating absract class Myapp and override there are still somre error because statelesswidget reqired const.. see using command.
  //this down line signify({String ?data}): super(data); we read in dart that we are passing data to super class(abstract class) using string ?data. similarly here we used super .key to pass key to super class
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // const beacause text will not change
    // return const Text('Hello, World!', textDirection: TextDirection.rtl);

    //9:15:00
    //Design :- how app shoulb be look or desingned
    //1.Material design:- created by android (google)
    //2.Cupertino Design: created by apple
    //Scafold :- it provide structure to app like appbar , body , bottom navigation bar etc , it is for local design while material app is for global design
    return const MaterialApp(
      //these are property of material app
      home: CurrencyConverterMaterialpage(),
      // Scaffold(
      //   body: Center(
      //     child: Text('i am aditya!!'), //Text('Hello World!')));
      //   ),
      // ),
    );
  }
}
