import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Views/Hotel_Details/HotelDetailsMain.dart';
import '../Views/Place_Detials/detials_place_detials.dart';
import '../core/app_colors/app_colors.dart';
import 'RandomNUM.dart';

class ApiHotelCard extends StatefulWidget {
  final String cardText;
  final String cardAddress;
  final List cardimgUrl;
  final int cardid;
  final double rate;
  final int price;

  ApiHotelCard({
    Key? key,
    required this.cardText,
    required this.cardAddress,
    required this.cardimgUrl,
    required this.cardid,
    required this.rate,
    required this.price,
  }) : super(key: key);

  @override
  State<ApiHotelCard> createState() => _ApiHotelCardState();
}

class _ApiHotelCardState extends State<ApiHotelCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelsDetails(id: widget.cardid),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  widget.cardimgUrl[0],
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cardText,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.blue,
                          size: 18.sp,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            "${widget.cardAddress}, Egypt",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "${widget.price} USD",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                              size: 24.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "${getRandomNumber()}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 24.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "${widget.rate}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
