import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/models/hotel.dart';

class HotelRepository {

  final Dio _dio = Dio();

 Future<List<Hotel>> fetchHotels() async {
  var headers = {
  'Authorization': 'Bearer 14|dMnfXJ7jIcxJktwEOoXGIecGgM5fEzjLLaquQDBr71f99e20'
  };    try {
      const String url = 'https://da0f-197-35-254-60.ngrok-free.app/api/user/favorite/getFavorites';
      Response response = await _dio.get(url,options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        List<dynamic> responseData = response.data['data'];
        List<Hotel> places = responseData.map((json) => Hotel.fromJson(json)).toList();
        print(places);

        return places;
      } else {
        print("=================================");
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      print("==========================================");

      throw Exception('Failed to fetch data: $error');
    }
  }
}
