import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors/app_colors.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          width: 356.w,
          height: 270.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.gray.withOpacity(.3))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bookingCard.png',width: 120,height: 80,),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: "Classic Lorem ipsum",fontWeight: FontWeight.w700,fontSize: 14,),
                      AppText(title: "dolor",fontWeight: FontWeight.w700,fontSize: 14,),
                      Container(
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.blue,
                            ),
                            Text(
                              "Alexandria ,Egypt",
                              style: TextStyle(fontSize: 12, color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(indent: 12),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: "Check in",fontSize: 12,fontWeight: FontWeight.w400,),
                      AppText(title: "Sat 9 Oct 2022",fontSize: 12,fontWeight: FontWeight.w400,)
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 82.w,
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.gray.withOpacity(.2)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                         Icon(Icons.nightlight_outlined,color: AppColors.blue,),
                          Text("13 nights",style: TextStyle(
                            color: AppColors.gray,
                            fontSize:10
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: "Check in",fontSize: 12,fontWeight: FontWeight.w400,),
                      AppText(title: "Sat 23 Oct 2022",fontSize: 12,fontWeight: FontWeight.w400,)
                    ],
                  ),
                ],
              ),
              Divider(indent: 12),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title: "Price"),
                      Row(
                        children: [
                          Text(
                            "1000 LE   ",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.black,
                              decorationThickness: 2.0,
                            ),
                          ),
                          AppText(title: "8000 LE", color: AppColors.yellow),
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      child: AppButton(
                    title: "Pending",
                    font_color: AppColors.black,
                    color: AppColors.light_blue,
                    border_color: AppColors.white,
                    onTap: () {
                      print("Cancel booking");
                    },
                  )),
                ],
              ),
              Divider(indent: 12),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                    title: "Cancel booking",
                    font_color: AppColors.blue,
                    color: AppColors.light_blue,
                    border_color: AppColors.white,
                    onTap: () {
                      print("Cancel booking");
                    },
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: AppButton(
                    title: "View confirmation ",
                    font_color: AppColors.white,
                    color: AppColors.blue,
                    border_color: AppColors.white,
                    onTap: () {
                      print("confirmation");
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8,)
      ],
    );
  }
}
