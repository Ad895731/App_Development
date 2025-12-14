import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      //Icon is widget here and Icons is class here
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(
                        //   Radius.elliptical(50, 50),

                        // topLeft: Radius.circular(30),
                        //bottomLeft: Radius.circular(30),
                        //topRight: Radius.circular(30),
                        //bottomRight: Radius.circular(30),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          //right: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
