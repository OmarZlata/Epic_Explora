import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/models/locations.dart';
part 'states.dart';
class GoogleMapsCubit extends Cubit<GoogleMapsStates> {
  GoogleMapsCubit() : super(GoogleMapsInit());

  Set<Marker> markers = {};

  Weather? weather;

  Future<void> getWeather() async {
    if (markers.isEmpty) {
      return;
    }
    final position = markers.first.position;
    emit(GoogleMapsLoading());
    try {
      final baseURL = 'http://api.weatherapi.com/v1/current.json';
      final params = '?q=${position.latitude}, ${position.longitude}';
      final apiKey = '&key=d0ebe8c2c6544e9a9be172025231009';
      final response = await Dio().get(baseURL + params + apiKey);
      weather = Weather.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    emit(GoogleMapsInit());
  }

  void selectMarker(LatLng value) {
    markers.add(Marker(
      markerId: MarkerId('selected_location'),
      position: value,
    ));
    emit(GoogleMapsInit());
  }

  void reset() {
    markers.clear();
    weather = null;
    emit(GoogleMapsInit());
  }

}
