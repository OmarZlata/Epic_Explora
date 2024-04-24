import 'package:epic_expolre/Views/Maps/splash/onboarding_3.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../core/app_colors/app_colors.dart';


class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 430,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/Frame.png',
                  width: 1000,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/Welcome2.png',
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          AppText(
            title: "Book Cheapest Fight",
            color: AppColors.black,
            fontSize: 22 ,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10,),
          AppText(
            title: "We compare prices from 200+ booking",
            color: AppColors.grey,
            fontSize: 18 ,

          ),
          AppText(
            title: "site to help you find the lowest price .",
            color: AppColors.grey,
            fontSize: 18 ,

          ),
          SizedBox(height:24 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/indicators2.png')

            ],),
          Spacer(),
          AppButton(
            title: "Next",
            color: AppColors.blue,
            font_color: AppColors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapSplashView(),));
            },
          ),
          SizedBox(height: 24,),
          AppButton(
            title: "Back",
            color: AppColors.white,
            font_color: AppColors.blue,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
