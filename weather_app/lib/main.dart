import 'package:flutter/material.dart';
import 'screens/welcomeScreen.dart';

void main() {
  runApp(const WeatherApp());
}

// ignore: camel_case_types
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}
