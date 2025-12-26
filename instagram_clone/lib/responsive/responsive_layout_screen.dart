import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  //final means variable that cannot be changed and different from const , it is initialized at runtime while const is initialized at compile time first const is used then final
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;
  const ResponsiveLayout({
    super.key,
    required this.webscreenlayout,
    required this.mobilescreenlayout,
  });
  @override
  //BuildContext is parameter of build method
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: avoid_types_as_parameter_names
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreensize) {
          return //webscreen;
          webscreenlayout; 
          
        } else {
          return //mobilescreen;
          mobilescreenlayout;
        }
      },
    );
  }
}
