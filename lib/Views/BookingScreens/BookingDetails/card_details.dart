import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/app_text_field.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        centerTitle: true,
        title: "Card details",
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          AppText(
              title: "Select Method",
              fontWeight: FontWeight.bold,
              fontSize: 16),
          SizedBox(height: 12.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: InkWell(
                  onTap: () {}, child: Center(
                    child: Icon(
                 FontAwesomeIcons.creditCard,
                    color: AppColors.white,
                ),
                  ),

                ),
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          AppText(
              title: "Name on Card", fontWeight: FontWeight.bold, fontSize: 16),
          SizedBox(
            height: 16.h,
          ),
          AppTextField(
              hint: "Card Name",
              radius: 8,
              obscureText: false,
              hintFontSize: 14),
          SizedBox(
            height:24.h,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    title: "Card Number",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                SizedBox(
                  height: 16.h,
                ),
                AppTextField(
                    hint: "Card Name",
                    radius: 8,
                    obscureText: false,
                    hintFontSize: 14),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        title: "Expire Date",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                        hint: "xx/xx",
                        radius: 8,
                        obscureText: false,
                        hintFontSize: 14),
                  ],
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        title: "CVV",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                        hint: "xxx",
                        radius: 8,
                        obscureText: false,
                        hintFontSize: 14),

                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 25.h,),
          AppButton(title: "Pay",
          color: AppColors.blue,
          font_color: AppColors.white,)
        ],
      ),
    );
  }
}
