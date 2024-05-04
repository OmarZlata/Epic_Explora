import 'package:epic_expolre/Views/MainScreens/search_screen.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_field.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 330.h,
      decoration: BoxDecoration(
        color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          Image.asset('assets/images/Group 101.png'),
          SizedBox(height: 8.h),
          Center(
              child: AppText(
                  title: 'Filter',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                  title: "States", fontSize: 16, fontWeight: FontWeight.bold)
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  title: 'All',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: 'Alex',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: 'Red Sea',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: 'Cairo',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: 'Aswan',
                  height: 37.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                  title: "Stars", fontSize: 16, fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  title: 'All',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: '1 Star',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: '2 Star',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: '3 Star',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: '4 Star',
                  height: 37.h,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppButton(
                  title: '5 Star',
                  height: 37.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: AppColors.black.withOpacity(.2), height: 1),
          SizedBox(height: 16.h),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: "Reset",
                    color: AppColors.light_blue,
                    border_color: AppColors.light_blue,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppButton(
                    title: "Show results",
                    color: AppColors.blue,
                    border_color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
