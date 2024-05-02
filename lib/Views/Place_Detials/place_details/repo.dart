import 'package:dio/dio.dart';
import 'details_model.dart';

class DataRepository {
  final Dio _dio = Dio();

  Future<Place> fetchData() async {
    try {
      Response response = await _dio.get(
        'https://e05a-197-35-196-141.ngrok-free.app/api/user/place/show/22',
      );

      // Parse the response data
      if (response.statusCode == 200) {
        return Place.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
