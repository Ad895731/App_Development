import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialpage extends StatelessWidget {
  const CurrencyConverterMaterialpage({super.key});
  @override
  //build function use only to write simple variable and function not like timer or complex code
  Widget build(BuildContext context) {
    //created a border funtion
    final border = const OutlineInputBorder(
      //Border Work
      borderSide: const BorderSide(
        color: Colors.lime,
        width: 1.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return Scaffold(
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
            Container(
              //difference between margin and paddling
              padding: EdgeInsetsGeometry.all(6),
              margin: EdgeInsets.all(5),
              color: Colors.amber,
              child: const Text(
                '1',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 187, 84, 76),
                ),
              ),
            ),
            //padding:- when want margin for textfield as it does not come under property of textfield double click->refractor->wrap with padding (text field)
            //container:- big brother of padding , conatain mainy property
            //Padding(
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 20, 19, 19),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  // label: Text(
                  //   'Enter the amount in USD',
                  //   style: TextStyle(color: Colors.red, fontSize: 20),
                  // ),
                  //we want some hint type thing which goes off when we write somethingh
                  hintText: 'Please enter amount you want to convert in USD',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 230, 221, 221),
                  ),
                  //suffix can be used when we required to put at last place
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: const Color.fromARGB(255, 230, 221, 221),
                  filled: true,
                  fillColor: const Color.fromARGB(225, 100, 100, 100),
                  enabled: true,
                  focusedBorder: border,
                  //now if I want that textfield wil be same before click and after click we use focused border when write somethingh and use enable border before writing somethingh
                  enabledBorder: border,
                ),
              ),
            ),
            //button:- there tow type of button here one is usaual like Icon and other is text button
            //1. Raised , 2.Appears like a text
            TextButton(
              onPressed: () {
                //there are three mode in app 1. debug :- when we are checking or creating
                //2.release , 3. profile
                if (kDebugMode) {
                  print('clicked');
                }
              },
              style: const ButtonStyle(
                //But why MaterialStatePropertyAll is not working here ????
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 14, 223, 80),
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.red),
                fixedSize: WidgetStatePropertyAll(Size(300, 30)),
              ),
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
