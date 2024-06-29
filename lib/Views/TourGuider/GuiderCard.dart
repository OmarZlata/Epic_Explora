import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
    );
  }
}
