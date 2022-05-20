import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:lottie/lottie.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '77d313853f394e81fe7a898232b1f8bf';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    print(latitude);

    longitude = location.longitude;
    print(longitude);
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    String data = response.body;
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(data);
      double temperaute = decodeData['main']['temp'];
      String condition = decodeData['weather'][0]['description'];
      String cityName = decodeData['name'];
      print(temperaute);
      print(condition);
      print(cityName);

      // var desc = decodeData['description'];
      // // ignore: avoid_print
      // print(desc);
    } else {
      print(response.statusCode);
    }
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
        const MainTitle(),
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
  const MainTitle({Key? key}) : super(key: key);

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
