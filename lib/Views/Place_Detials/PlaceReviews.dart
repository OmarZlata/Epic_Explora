import 'package:flutter/material.dart';
import '../../core/app_colors/app_colors.dart';

class PlaceReviewsScreen extends StatefulWidget {
  const PlaceReviewsScreen({Key? key}) : super(key: key);

  @override
  State<PlaceReviewsScreen> createState() => _PlaceReviewsScreenState();
}

class _PlaceReviewsScreenState extends State<PlaceReviewsScreen> {
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
              TextField(
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Write feedback",
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.yellow,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
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
                itemCount: 7,
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
