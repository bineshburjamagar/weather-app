import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dart:math' as math;

class MainTitle extends StatefulWidget {
  const MainTitle({Key? key, this.locationWeather}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  int? temp;
  String? condition;
  String? cityName;
  var humidity;
  var visibilty;
  var pressure;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double temperature = weatherData['main']['temp'];
    temp = temperature.toInt();
    condition = weatherData['weather'][0]['description'];
    cityName = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    visibilty = weatherData['visibility'];
    pressure = weatherData['main']['pressure'];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Lottie.network(
          'https://assets9.lottiefiles.com/packages/lf20_boJRmE.json',
          fit: BoxFit.cover,
          height: double.infinity),

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
        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '$humidity %',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Humidity',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                children: [
                  Text(
                    '$visibilty km',
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Visibility',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                children: [
                  Text(
                    '$pressure pa',
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Pressure',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),

      //const MainTitle(),

      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$cityName',
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF300016),
                      fontSize: 30.00,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Grape Nuts'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('$temp°',
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFFDA9B98),
                          fontSize: 100.00)),
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
                    child: Text('$condition',
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF835496),
                            fontSize: 30.00,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Grape Nuts')),
                  )),
            ],
          ),
        ],
      )
    ]);
  }
}
