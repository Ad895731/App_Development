import 'package:flutter/material.dart';

class CurrencyConverterMaterialpage extends StatelessWidget {
  const CurrencyConverterMaterialpage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //for property of Scaffold
      backgroundColor: Color.fromARGB(255, 111, 157, 180),
      // body: ColoredBox(
      //   color: Color.fromRGBO(255, 1, 1, 100),
      //   child: /*Center*/ Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     //crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [Text(' currency app. 77777777777')],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 187, 84, 76),
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                // label: Text(
                //   'Enter the amount in USD',
                //   style: TextStyle(color: Colors.red, fontSize: 20),
                // ),
                //we want some hint type thing which goes off when we write somethingh
                hintText: 'Please enter amount you want to convert in USD',
                hintStyle: TextStyle(color: Color.fromARGB(255, 230, 221, 221)),
                //suffix can be used when we required to put at last place
                prefixIcon: Icon(Icons.monetization_on_outlined),
                prefixIconColor: Color.fromARGB(255, 230, 221, 221),
                filled: true,
                fillColor: Color.fromARGB(225, 100, 100, 100),
                enabled: true,
                focusedBorder: OutlineInputBorder()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
