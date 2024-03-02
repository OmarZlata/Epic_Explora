import 'package:flutter/material.dart';
import 'Views/MainScreens/home_screen.dart';
import 'Views/MainScreens/search_screen.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'Views/MainScreens/select_location.dart';
import 'Views/Signin/Forget_Password.dart';
import 'Views/Signin/Reset_Password.dart';
import 'Views/Signin/SignUp.dart';
import 'Views/Signin/Verification.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: bottomNavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

