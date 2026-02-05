import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_bakchodi/homescreen.dart';
import 'package:riverpod_bakchodi/user.dart';

//Providers
// Provider
//StateProvider
//StateNotifier and StateNotifierProvider
//ChangeNotifier and ChangeNotifierProvider
// future provider


// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(User(name: '', age: 0)),
// );
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
