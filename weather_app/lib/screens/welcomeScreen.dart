// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
    // ignore: avoid_print
    print(location.latitude);
    // ignore: avoid_print
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
