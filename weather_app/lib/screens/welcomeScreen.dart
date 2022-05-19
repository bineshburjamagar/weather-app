// ignore_for_file: deprecated_member_use, file_names

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:lottie/lottie.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getData();
  }

  void getLocation() {
    Location location = Location();
    location.getCurrentLocation();
    // ignore: avoid_print
    print(location.latitude);
    // ignore: avoid_print
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http
        .get(Uri.parse('https://goweather.herokuapp.com/weather/Pokhara'));
    String data = response.body;
    var decodeData = jsonDecode(data);
    var temp = decodeData['temperature'];
    print(temp);
    var desc = decodeData['description'];
    print(desc);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: <Widget>[
        Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_boJRmE.json',
            fit: BoxFit.cover,
            height: double.infinity),
        MainTitle(),
        GlassmorphicContainer(
            // padding: const EdgeInsets.fromLTRB(0.0, 400, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(40.0, 650.0, 0.0, 0.0),
            width: 350,
            height: 100,
            borderRadius: 20,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: const [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.5),
                const Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            )),
      ]),
    ));
  }
}

class MainTitle extends StatefulWidget {
  MainTitle({Key? key}) : super(key: key);

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'NEPAL',
                style: TextStyle(
                    color: Color(0xFF300016),
                    fontSize: 30.00,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Grape Nuts'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text('28°',
                    style:
                        TextStyle(color: Color(0xFFDA9B98), fontSize: 150.00)),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
                height: 100.0,
                margin: const EdgeInsets.fromLTRB(20.0, 120.0, 0.0, 20.0),
                // padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 50.0),
                alignment: Alignment.topCenter,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: const Text('Clear skies',
                      style: TextStyle(
                          color: Color(0xFF835496),
                          fontSize: 30.00,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Grape Nuts')),
                )),
          ],
        ),
      ],
    );
  }
}
