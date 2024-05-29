import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors/app_colors.dart';

class FavoriteCard extends StatelessWidget {
  final String placeName;

  final String imageUrl;

  final String placeAddress;

  const FavoriteCard({Key? key, required this.placeName, required this.imageUrl, required this.placeAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130.w,
              height: 150.h,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl, // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placeName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf9fafb),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.Blue,
                          ),
                          Text(
                            '$placeAddress, Egypt ',
                            style: TextStyle(fontSize: 12.sp, fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$14.4",
                      style: TextStyle(fontSize: 18.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                /*padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                                minimumSize: WidgetStateProperty.all<Size>(const Size(24, 24)),*/
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: Icon(
                                Icons.favorite_border,
                                color: AppColors.Red,
                                size: 24.sp,
                              ),
                            ),
                            Text(
                              "294 Likes",
                              style: TextStyle(fontSize: 16.sp, color: AppColors.gray, fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/rate.png'),
                            const SizedBox(width: 4),
                            Text(
                              "4.5",
                              style: TextStyle(fontSize: 16.sp, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 32)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
