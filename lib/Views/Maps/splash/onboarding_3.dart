import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/tour_guide_views/Auth/guide_signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/app_button.dart';
import '../../../Widgets/app_text.dart';
import '../../../core/Location_utlis/location_utils.dart';
import '../../../core/app_colors/app_colors.dart';
import '../google_map/view.dart';

class GoogleMapSplashView extends StatefulWidget {
  const GoogleMapSplashView({Key? key}) : super(key: key);

  @override
  State<GoogleMapSplashView> createState() => _GoogleMapSplashViewState();
}

class _GoogleMapSplashViewState extends State<GoogleMapSplashView> {
  @override
  void initState() {
    LocationUtils.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      'assets/images/Welcome1.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            AppText(
              title: "Find Your Location ",
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 5,
            ),
            AppText(
              title: "Find Every Place Around You ",
              color: AppColors.grey,
              fontSize: 18,
            ),
            AppText(
              title: "Let's Explore",
              color: AppColors.grey,
              fontSize: 18,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/images/indicators3.png')],
            ),
            Spacer(),
            AppButton(
              title: "Register As User ",
              color: AppColors.blue,
              font_color: AppColors.white,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SignInView(),
                ));
              },
            ),
            SizedBox(height: 10.h,),
            AppButton(
              title: "Register As Guider",
              color: AppColors.white,
              font_color: AppColors.violet,
              border_color: AppColors.violet.withOpacity(.3),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => GuiderSignIn(),
                ));
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
