import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
//import 'package:shop_app/global_variable.dart';
import 'package:shop_app/pages/homepage.dart';
//import 'package:shop_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

//different types of provider
// provider:- it only read value and provide to the widget tree and
//changenotifierprovider:- change the value and notify the widget that are listening to changes
//fututreprovider :-it can listen to future and show changes which is completed in future
//streamprovider :- it can listen to stream of data and show changes when new data is available
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        //debugShowCheckedModeBanner: false,
        title: 'Shopping App',

        //theme is used to set the global font family for the app
        //colorScheme is used to set the primary color of the app , primary means ??
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1),
          ),
          //can be overriden by usual value
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            //color: Colors.black,
          ),
          useMaterial3: true,
        ),
        home: HomePage(),

        //ProductDetailsPage(
        //  product: products[0],
      ),
    );
  }
}
