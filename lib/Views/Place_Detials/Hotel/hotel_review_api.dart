import 'package:dio/dio.dart';

import '../../../core/api/consts/end_points.dart';
import 'hotel_review_model.dart';

class HotelReviewRepository {
  final Dio _dio = Dio();

  Future<HotelReview> fetchHotelReviews() async {
    try {
       String url = '${EndPoint.baseUrl}api/user/review/getHotelReview/1';
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        return HotelReview.fromJson(response.data);
      } else {
        // Handle error
        throw Exception('Failed to fetch hotel reviews');
      }
    } catch (error) {
      // Handle error
      throw Exception('Failed to fetch hotel reviews: $error');
    }
  }
}
