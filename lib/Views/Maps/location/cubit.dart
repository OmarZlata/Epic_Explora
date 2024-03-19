import 'package:dio/dio.dart';
import 'package:epic_expolre/core/models/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/Location_utlis/location_utils.dart';
part 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  Location? location;

  Future<void> getCurrentWeather() async {
    final position = LocationUtils.currentPosition;
    if (position == null) {
      return;
    }
    emit(HomeLoading());
    try {
      final baseURL = 'http://api.weatherapi.com/v1/current.json';
      final params = '?q=${position.latitude}, ${position.longitude}';
      final apiKey = '&key=58a1c88372354d15bf0115542241403';
      final response = await Dio().get(baseURL + params + apiKey);
      location = Location.fromJson(response.data);
    } catch (e) {
      print("e");
    }
    emit(HomeInit());
  }

}