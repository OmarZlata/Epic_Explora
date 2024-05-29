import 'dart:developer';

import 'package:epic_expolre/Views/search/search_screen.dart';
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
  int _selectedState = -1;
  int _selectedType = -1;
  String ?title ;
  String ?states;

  void _selectState(int index) {
    setState(() {
      _selectedState = index;
    });
  }
  void _selectType(int index) {
    setState(() {
      _selectedType = index;
    });
  }

  Color? _getSearchType(int index) {
    return _selectedType == index ? AppColors.blue : Colors.grey[200];
  }
  Color? _getStateButtonColor(int index) {
    return _selectedState == index ? AppColors.blue : Colors.grey[200];
  }
  Color _getStateTextColor(int index) {
    return _selectedState == index ? Colors.white : Colors.black;
  }
  Color _getTypeTextColor(int index) {
    return _selectedType == index ? Colors.white : Colors.black;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 285.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/Group 101.png'),
          SizedBox(height: 8.h),
          Center(
            child: AppText(
              title: 'Filter',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              for (int i = 0; i < 2; i++)
                Expanded(
                  child: AppButton(
                    title: ['Places','Hotels'][i],
                    height: 37.h,
                    color: _getSearchType(i),
                    font_color: _getTypeTextColor(i),
                    onTap: () {
                      _selectType(i);
                      setState(() {
                        title = ['Places','Hotels'][i];
                      });
                      log("$title");

                    },

                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                title: "States",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),

          SizedBox(height: 16.h),
          Row(
            children: [
              for (int i = 0; i < 5; i++)
                Expanded(
                  child: AppButton(
                    title: ['All', 'Alex', 'Red Sea', 'Cairo', 'Aswan'][i],
                    height: 37.h,
                    color: _getStateButtonColor(i),
                    font_color: _getStateTextColor(i),
                    onTap:() {
                      _selectState(i);
                      setState(() {
                        states = ['All', 'Alexandria', 'Red Sea', 'Cairo', 'Aswan'][i];
                      });
                      log("$states");

                    },
                  ),
                ),
            ],
          ),
          SizedBox(height: 24.h),
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
                    onTap: () {
                      setState(() {
                        _selectedState = -1;
                        _selectedType = -1;
                      });
                    },
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
                        builder: (context) => SearchScreen(title:title!,states: states!),
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