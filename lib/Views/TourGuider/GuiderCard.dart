import 'package:epic_expolre/Widgets/Guider/resqust_screen.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/app_colors/app_colors.dart';

class GuiderCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String description;
  final bool isVerified;

  const GuiderCard({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.description,
    required this.isVerified,
  });

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: AppText(
                title: 'Guider Info',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.blue,
              )),
          content: Container(
            height: 225,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: 'Name: $name',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(height: 8),
                AppText(
                  title: 'Phone Number: $phoneNumber',
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(height: 8),
                AppText(
                  title: 'Email: $email',
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(height: 8),
                AppText(
                  title: 'Description: $description',
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    AppText(
                      title: 'Verified: ',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    Icon(
                      isVerified ? Icons.check_circle : Icons.cancel,
                      color: isVerified ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: "Cancel",
                    color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: AppButton(
                    title: "Request",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DescriptionScreen(),));
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          _showAlertDialog(context);
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 18,
                    color: AppColors.blue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 18,
                    color: AppColors.blue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: AppColors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isVerified ? AppColors.green : AppColors.red,
                ),
                child: Text(
                  isVerified ? "Verified" : "Not Verified",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
