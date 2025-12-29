import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  // here _user is a private variable of type User? which will hold the user data and it is private because we don't want other classes to access it directly and in order to access it we will create a getter and setter method
  User? _user;
  final AuthMethod _authMethod = AuthMethod();
  // here getUser is a getter method that will return the user data , get is used to define a getter method
  User?get getUser => _user;
  //refreshUser
  Future<void> refreshUser() async {
    User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
