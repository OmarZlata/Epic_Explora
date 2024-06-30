import 'package:epic_expolre/Views/Maps/splash/onboarding_3.dart';
import 'package:epic_expolre/Views/WelcomeScreens/onboarding_1.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../core/app_colors/app_colors.dart';
import '../../generated/l10n.dart';


class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

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
                      'assets/images/Welcome2.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            AppText(
              title: S.of(context).bookFlight,
              color: AppColors.black,
              fontSize: 22 ,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10,),
            AppText(
              title: S.of(context).comparePrices,
              color: AppColors.grey,
              fontSize: 18 ,

            ),
            AppText(
              title: S.of(context).lowestPrice,
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
              title: S.of(context).next,
              color: AppColors.blue,
              font_color: AppColors.white,
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleMapSplashView(),));
              },
            ),
            SizedBox(height: 24,),
            AppButton(
              title: S.of(context).back,
              color: AppColors.white,
              font_color: AppColors.blue,
              border_color: AppColors.grey.withOpacity(.3),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen1(),
                    ));
              },
            ),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
