import 'dart:ui';

import 'package:flutter/material.dart';

class HourlyForcast extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForcast({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          color: const Color.fromARGB(88, 91, 82, 111),
          elevation: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),

                child: Column(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(icon, size: 30),
                    SizedBox(height: 5),
                    Text(temperature, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
