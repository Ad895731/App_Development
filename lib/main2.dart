import 'package:flutter/material.dart';
import 'widget.dart';

void main() {
  runApp(const MyAp());
}

class MyAp extends StatelessWidget {
  const MyAp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyStateFulWidget());
  }
}
