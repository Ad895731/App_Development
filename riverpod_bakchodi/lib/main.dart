import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_bakchodi/homescreen.dart';
import 'package:riverpod_bakchodi/user.dart';

//Providers
// Provider
//StateProvider
//StateNotifier and StateNotifierProvider
//ChangeNotifier and ChangeNotifierProvider
// future provider
//stream provider 

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(User(name: '', age: 0)),
// );

// final fetchUserProvider = FutureProvider((ref) {
//   const url = "https://jsonplaceholder.typicode.com/users/1";
//   return http.get(Uri.parse(url)).then((value) {
//     if (value.statusCode == 200) {
//       return User.fromJson(jsonDecode(value.body));
//     } else {
//       throw Exception("HTTP ${value.statusCode}: ${value.body}");
//     }
// }).catchError((e) {
//   throw Exception('Failed to load user: $e');
// }
//});
//});
// final fetchUserProvider = FutureProvider<User>((ref) async {
//   final response = await http.get(Uri.parse('https://dummyjson.com/users/1'));

//   if (response.statusCode == 200) {
//     final jsonMap = json.decode(response.body);
//     final data = jsonMap['data'];

//     return User.fromMap({'name': data['first_name'], 'id': data['id']});
//   } else {
//     throw Exception('HTTP ${response.statusCode}');
//   }
// });
final fetchUserProvider = FutureProvider<User>((ref) async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/users/1'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body); // 👈 directly the object

    return User.fromMap({
      'name': data['firstName'], // ✅ correct key
      'id': data['id'],
    });
  } else {
    throw Exception('HTTP ${response.statusCode}');
  }
});
final streamProvider = StreamProvider((ref)
  async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
);
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
