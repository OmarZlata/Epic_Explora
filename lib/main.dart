import 'package:flutter/material.dart';
import 'package:graduation_project/Views/WelcomeScreens/Signin/SignUp.dart';
import 'package:graduation_project/Views/WelcomeScreens/Signin/Signin.dart';
import 'package:graduation_project/Views/WelcomeScreens/splash_screen.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
      ),
      home: SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

