import 'package:geolocator/geolocator.dart';

abstract class LocationUtils {

  static Position? currentPosition;

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever || permission == LocationPermission.unableToDetermine) {
      print('Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }

    currentPosition = await Geolocator.getCurrentPosition();
    return currentPosition;
  }

}