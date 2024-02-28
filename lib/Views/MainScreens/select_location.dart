import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/app_button.dart';
import 'home_screen.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Select Location",
            style: TextStyle(
                color: AppColors.Black,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              width: double.infinity,
              height: 239,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: AppColors.white,
                  ),
              child: Column(
                children: [
                  SizedBox(height:16 ,),
                  Image.asset('assets/images/Group 101.png'),
                  SizedBox(height:22 ,),
                  Image.asset('assets/images/location.png'),
                  SizedBox(height:8 ,),
                  Text("Current location",style: TextStyle(
                    color: AppColors.Blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height:8 ,),
                  Text("Location code",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  )),
                  SizedBox(height: 25,),
                  AppButton(
                    title: "set my location",
                    color: AppColors.Blue,
                    font_color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
