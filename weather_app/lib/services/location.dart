import 'package:geolocator/geolocator.dart';

class Location {
  // ignore: prefer_typing_uninitialized_variables
  var latitude;
  // ignore: prefer_typing_uninitialized_variables
  var longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      // ignore: avoid_print
      print(position);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
