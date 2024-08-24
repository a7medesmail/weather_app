import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'there is no weather 😔 start searching now 🔎',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}