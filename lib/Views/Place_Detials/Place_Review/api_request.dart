import 'package:dio/dio.dart';
import 'package:graduation_project/core/api/consts/end_points.dart';

import 'get_review_model.dart';

class ReviewService {
  final Dio _dio = Dio();

  Future<GetReviews> fetchReviews() async {
    try {
      // Define the URL for your API endpoint
       String url = '${EndPoint.baseUrl}api/user/review/getPlaceReview/22';

      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        return GetReviews.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch reviews');
      }
    } catch (error) {
      throw Exception('Failed to fetch reviews: $error');
    }
  }
}
