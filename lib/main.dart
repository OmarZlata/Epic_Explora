import 'package:flutter/material.dart';
import 'My_Trips/Add_Trip/add_trip.dart';
import 'My_Trips/alexandria_trip.dart';
import 'Views/Profile/AppMode.dart';
import 'Views/Profile/Settings.dart';
import 'Views/Profile/Terms.dart';
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
      ),
      home:SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

