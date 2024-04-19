import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../core/app_colors/app_colors.dart';
import '../Signin/SignUp.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({super.key});

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
                    'assets/images/Welcome3.png',
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          AppText(
            title: "Share your experiences",
            color: AppColors.black,
            fontSize: 22 ,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10,),
          AppText(
            title: "Allow users to share their travel experiences",
            color: AppColors.grey,
            fontSize: 18 ,

          ),
          AppText(
            title: "on social media platforms .",
            color: AppColors.grey,
            fontSize: 18 ,

          ),
          Spacer(),
          AppButton(
            title: "Next",
            color: AppColors.blue,
            font_color: AppColors.white,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen(),));
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
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}
