import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/utils/globel_variable.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  //final means variable that cannot be changed and different from const , it is initialized at runtime while const is initialized at compile time first const is used then final
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;
  const ResponsiveLayout({
    super.key,
    required this.webscreenlayout,
    required this.mobilescreenlayout,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  void addData() async {
    //Here we can fetch the data from the server or database and set it to the state variable
    //here UserProvider() is used to create an instance of UserProvider class and _userProvider is the variable that holds the instance of UserProvider class, await _userProvider.refreshUser(); is used to call the refreshUser method of UserProvider class which will fetch the user data from the server or database and set it to the state variable
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  //BuildContext is parameter of build method
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: avoid_types_as_parameter_names
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreensize) {
          return //webscreen;
          widget.webscreenlayout;
        } else {
          return //mobilescreen;
          widget.mobilescreenlayout;
        }
      },
    );
  }
}
