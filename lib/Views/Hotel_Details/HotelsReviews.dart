import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';

class HotelReviewsScreen extends StatefulWidget {
  HotelReviewsScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<HotelReviewsScreen> createState() => _HotelReviewsScreenState();
}

class _HotelReviewsScreenState extends State<HotelReviewsScreen> {
  TextEditingController reviewController = TextEditingController();
  final String baseUrl = EndPoint.baseUrl;
  int _starRating = 0;

  Future<void> putReview(String review, int starRating) async {
    final BaseOptions baseOptions = BaseOptions(
      validateStatus: (statusCode) {
        return statusCode == 200 || statusCode == 422;
      },
      headers: {
        "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
        "Accept": "application/json",
        "Accept-Encoding": "gzip, deflate, br",
        "Content-Type": "application/json",
      },
    );
    final Dio _dio = Dio(baseOptions);

    try {
      final data = {
        'comments': review,
        'star_rating': starRating,
      };

      print('Data: $data');
      final response = await _dio.post(
        '${baseUrl}api/user/review/makeReview/hotel/${widget.id}',
        data: data,
      );


      if (response.statusCode == 200) {
        // Handle successful response
        print('Profile updated successfully: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Review submitted successfully!'),
            backgroundColor: AppColors.blue,
          ),
        );
        reviewController.clear();
        setState(() {
          _starRating = 0;
        });
      } else {
        // Handle non-200 status codes
        print('Failed to update profile: ${response.statusCode}');
        print('Response: ${response.data}');
        print('Headers: ${response.headers}');
        print('Request: ${response.requestOptions}');
        print('Response Data: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit review. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle errors
      print('Error updating profile: $e');
    }
  }


  Widget textFieldReview() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      controller: reviewController,
      decoration: InputDecoration(
        hintText: "Write feedback",
        suffixIcon: IconButton(
          icon: Icon(
            Icons.send,
            color: AppColors.yellow,
          ),
          onPressed: () {
            final review = reviewController.text;
            putReview(review, _starRating);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget starRatingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _starRating ? Icons.star : Icons.star_border,
            color: AppColors.yellow,
          ),
          onPressed: () {
            setState(() {
              _starRating = index + 1;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Review this hotel",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 15),
              textFieldReview(),
              SizedBox(height: 20),
              Text(
                "Rate this hotel",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              starRatingWidget(),
              SizedBox(height: 20),
              Text(
                "Overall Rating",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 10),
              _buildRatingRow("5 stars", "assets/images/86%.png", "86%"),
              _buildRatingRow("4 stars", "assets/images/60%.png", "60%"),
              _buildRatingRow("3 stars", "assets/images/40%.png", "40%"),
              _buildRatingRow("2 stars", "assets/images/40%.png", "40%"),
              _buildRatingRow("1 stars", "assets/images/40%.png", "40%"),
              SizedBox(height: 20),
              Text(
                "All reviews",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _buildReviewItem();
                },
              ),
              SizedBox(height: 20),
              Text(
                "Best Time to Visit",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "When is the best time to visit your property for the perfect beach holiday?",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(String rating, String imagePath, String percentage) {
    return Row(
      children: [
        Text(
          rating,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 131,
            height: 9,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 5),
        Text(percentage),
      ],
    );
  }

  Widget _buildReviewItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffF9FAFB),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline_outlined,
                    size: 35,
                    color: AppColors.blue,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed Nasser",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Image.asset(
                        "assets/images/rating.png",
                        width: 84,
                        height: 16,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "December 2022",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Text(
                "When is the best time to visit your property for the perfect beach holiday?",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
