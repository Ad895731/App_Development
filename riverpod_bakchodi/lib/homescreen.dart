import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_bakchodi/main.dart';
import 'package:riverpod_bakchodi/user.dart';
import 'providers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            //final user = ref.watch(userProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                // TextField(
                //   onSubmitted: (value) {
                //     ref.read(userProvider.notifier).updateName(value, user.age);
                //   },
                // ),
               // Text(user.name),
                // TextField(
                //   onSubmitted: (values) {
                //     ref
                //         .read(userProvider.notifier)
                //         .updateName(user.name, int.parse(values));
                //   },
                // ),
                // Text(user.age.toString()),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
