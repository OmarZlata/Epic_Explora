import 'package:dio/dio.dart';
import 'package:epic_expolre/core/models/user_models/place_reviews_model.dart';

import '../../api/const_end_ponits.dart';


class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = EndPoint.baseUrl;

  Future<List<UserReview>> fetchUserReviews(int placeId) async {
    final response = await _dio.get('${baseUrl}api/user/review/makeReview/place/$placeId');

    if (response.statusCode == 200) {
      final data = (response.data['data']['userReviews'] as List)
          .map((userReview) => UserReview.fromJson(userReview))
          .toList();
      return data;
    } else {
      throw Exception('Failed to load user reviews');
    }
  }
}
