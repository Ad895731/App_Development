import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  //final means variable that cannot be changed and different from const , it is initialized at runtime while const is initialized at compile time first const is used then final
  final Widget webscreenlayout;
  final Widget mobilescreenlayout;
  const ResponsiveLayout({
    Key? key,
    required this.webscreenlayout,
    required this.mobilescreenlayout,
  }) : super(key: key);
  @override
  //BuildContext is parameter of build method
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth > webscreensize) {
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
