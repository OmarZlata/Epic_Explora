import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/bottomNavigationBar.dart';
import 'home_screen.dart';

class SelectLocation extends StatefulWidget {

  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(

      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height:16 ,),
                  Image.asset('assets/images/Group 101.png'),
                  SizedBox(height:22 ,),
                  Image.asset('assets/images/location.png'),
                  SizedBox(height:8 ,),
                  Text("Current location",style: TextStyle(
                    color: AppColors.blue,
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
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottomNavigationBar(),));
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Select Location",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/sanaa map .png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: AppButton(
                  title: "Select Location",
                  color: AppColors.blue,
                  font_color: AppColors.white,
                  onTap: () {
                    _showBottomSheet(context);
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}

//
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => HomeScreen(),
// ));