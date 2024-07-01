import 'package:flutter/material.dart';
import '../../core/app_colors/app_colors.dart';

class ReviewCard extends StatelessWidget {
  final String userName;
  final String comment;

  const ReviewCard({
    Key? key,
    required this.userName,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        userName,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      // Example of review comment
                      Text(
                        comment,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
