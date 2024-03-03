import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/app_colors/app_colors.dart';
import 'onboarding_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    WelcomeScreen1()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Blue,
      body  : Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white
          ),
            child: Column(

              children: [
                SizedBox(height: 12,),
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 10,),
                Text("Epic Explore",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.Black
                ),)
              ],
            )
        ),
      ),
    );
  }
}
