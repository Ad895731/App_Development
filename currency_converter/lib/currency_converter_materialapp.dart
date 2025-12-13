//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//statefull widget uses const so it cannot be called simply and evrry time your UI got change to create. this we need to extend to state so that when any change occur state should be called not widget
class CurrencyConverterMaterialpage extends StatefulWidget {
  const CurrencyConverterMaterialpage({super.key});

  @override
  //for improvement we will use <T>
  State<CurrencyConverterMaterialpage> createState() {
    /*it's block not an arrow(=>)*/
    return _Currencyconvertermaterialpagestate();
  }
}

class _Currencyconvertermaterialpagestate
    extends State<CurrencyConverterMaterialpage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  @override
   void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  //   //build function use only to write simple variable and function not like timer or complex code
  Widget build(BuildContext context) {
    //we need to write variable here because here varibale can change in function outside it's stateless so immutable
    //created a border funtion
    final border = const OutlineInputBorder(
      //Border Work
      borderSide: BorderSide(
        color: Colors.lime,
        width: 1.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return Scaffold(
      //for property of Scaffold
      backgroundColor: const Color.fromARGB(255, 111, 157, 180),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 157, 180),
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 251, 249, 249),
          ),
        ),
        // body: ColoredBox(
        //   color: Color.fromRGBO(255, 1, 1, 100),
        //   child: /*Center*/ Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     //crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [Text(' currency app. 77777777777')],
        //   ),
        // ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 187, 84, 76),
                ),
              ),
              //padding:- when want margin for textfield as it does not come under property of textfield double click->refractor->wrap with padding (text field)
              //container:- big brother of padding , conatain mainy property
              //Padding(
              TextField(
                controller: textEditingController,
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
                // onSubmitted: (value) => result,
              ),
              //button:- there tow type of button here one is usaual like Icon and other is text button
              //1. Raised , 2.Appears like a text
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  //print(textEditingController) not work because it will print in terminal we want in our app
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                  });
                  //there are three mode in app 1. debug :- when we are checking or creating
                  //2.release , 3. profile
                  //   if (kDebugMode) {
                  //     print('clicked');
                  //   }
                },

                // style: const ButtonStyle(
                //   //But why MaterialStatePropertyAll is not working here ????
                //   backgroundColor: WidgetStatePropertyAll(
                //     Color.fromARGB(255, 14, 223, 80),
                //   ),
                //   foregroundColor: WidgetStatePropertyAll(Colors.red),
                //   minimumSize: WidgetStatePropertyAll(
                //     Size(double.infinity, 10),
                //   ),
                // ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 33, 32),
                  foregroundColor: const Color.fromARGB(255, 204, 194, 193),
                  minimumSize: const Size(double.infinity, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                ),
                child: const Text('Convert', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CurrencyConverterMaterialpage extends StatelessWidget {
//   const CurrencyConverterMaterialpage({super.key});//???
//   @override
//   //build function use only to write simple variable and function not like timer or complex code
//   Widget build(BuildContext context) {
//     //we need to write variable here because here varibale can change in function outside it's stateless so immutable
//     double result = 0;
//     final TextEditingController textEditingController = TextEditingController();
//     //created a border funtion
//     final border = const OutlineInputBorder(
//       //Border Work
//       borderSide: BorderSide(
//         color: Colors.lime,
//         width: 1.0,
//         style: BorderStyle.solid,
//         strokeAlign: BorderSide.strokeAlignOutside,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//     );
//     return Scaffold(
//       //for property of Scaffold
//       backgroundColor: const Color.fromARGB(255, 111, 157, 180),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 111, 157, 180),
//         title: const Text(
//           'Currency Converter',
//           style: TextStyle(
//             fontSize: 30,
//             color: Color.fromARGB(255, 251, 249, 249),
//           ),
//         ),
//         // body: ColoredBox(
//         //   color: Color.fromRGBO(255, 1, 1, 100),
//         //   child: /*Center*/ Column(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     //crossAxisAlignment: CrossAxisAlignment.stretch,
//         //     children: [Text(' currency app. 77777777777')],
//         //   ),
//         // ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               //difference between margin and paddling
//               padding: const EdgeInsetsGeometry.all(6),
//               // margin:  const EdgeInsets.all(5),
//               //color: Colors.amber,
//               child: Text(
//                 result.toString(),
//                 style: const TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 187, 84, 76),
//                 ),
//               ),
//             ),
//             //padding:- when want margin for textfield as it does not come under property of textfield double click->refractor->wrap with padding (text field)
//             //container:- big brother of padding , conatain mainy property
//             //Padding(
//             Container(
//               padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//               child: TextField(
//                 controller: textEditingController,
//                 keyboardType: const TextInputType.numberWithOptions(
//                   signed: false,
//                   decimal: true,
//                 ),
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 20, 19, 19),
//                   fontSize: 18,
//                 ),
//                 decoration: InputDecoration(
//                   // label: Text(
//                   //   'Enter the amount in USD',
//                   //   style: TextStyle(color: Colors.red, fontSize: 20),
//                   // ),
//                   //we want some hint type thing which goes off when we write somethingh
//                   hintText: 'Please enter amount you want to convert in USD',
//                   hintStyle: const TextStyle(
//                     color: Color.fromARGB(255, 230, 221, 221),
//                   ),
//                   //suffix can be used when we required to put at last place
//                   prefixIcon: const Icon(Icons.monetization_on_outlined),
//                   prefixIconColor: const Color.fromARGB(255, 230, 221, 221),
//                   filled: true,
//                   fillColor: const Color.fromARGB(225, 100, 100, 100),
//                   enabled: true,
//                   focusedBorder: border,
//                   //now if I want that textfield wil be same before click and after click we use focused border when write somethingh and use enable border before writing somethingh
//                   enabledBorder: border,
//                 ),
//                 // onSubmitted: (value) => result,
//               ),
//             ),
//             //button:- there tow type of button here one is usaual like Icon and other is text button
//             //1. Raised , 2.Appears like a text
//             Container(
//               padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//               //we will elevatedbutton because it give 3 d effect
//               child: TextButton(
//                 onPressed: () {
//                   //print(textEditingController) not work because it will print in terminal we want in our app
//                   result = double.parse(textEditingController.text) * 81;
//                   //there are three mode in app 1. debug :- when we are checking or creating
//                   //2.release , 3. profile
//                   //   if (kDebugMode) {
//                   //     print('clicked');
//                   //   }
//                 },

//                 // style: const ButtonStyle(
//                 //   //But why MaterialStatePropertyAll is not working here ????
//                 //   backgroundColor: WidgetStatePropertyAll(
//                 //     Color.fromARGB(255, 14, 223, 80),
//                 //   ),
//                 //   foregroundColor: WidgetStatePropertyAll(Colors.red),
//                 //   minimumSize: WidgetStatePropertyAll(
//                 //     Size(double.infinity, 10),
//                 //   ),
//                 // ),
//                 style: TextButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 32, 33, 32),
//                   foregroundColor: const Color.fromARGB(255, 204, 194, 193),
//                   minimumSize: const Size(double.infinity, 10),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(5),
//                   ),
//                 ),
//                 child: const Text('Convert', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
