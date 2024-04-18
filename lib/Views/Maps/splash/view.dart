import 'package:flutter/material.dart';

import '../../../Widgets/app_button.dart';
import '../../../Widgets/app_text.dart';
import '../../../core/Location_utlis/location_utils.dart';
import '../../../core/app_colors/app_colors.dart';
import '../google_map/view.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    LocationUtils.getCurrentLocation();
    super.initState();
  }

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

          Spacer(),
          AppButton(
            title: "Next",
            color: AppColors.blue,
            font_color: AppColors.white,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GoogleMapsView(),
              ));
            },
          ),
          SizedBox(height: 25,)
        ],
      ),
    );
  }
}
