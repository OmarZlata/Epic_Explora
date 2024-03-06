import 'package:flutter/material.dart';
import 'My_Trips/Add_Trip/add_trip.dart';
import 'My_Trips/alexandria_trip.dart';
import 'My_Trips/future.dart';
import 'My_Trips/present.dart';
import 'Views/MainScreens/home_screen.dart';
import 'Views/MainScreens/select_location.dart';
import 'Views/Profile/AppMode.dart';
import 'Views/Profile/Settings.dart';
import 'Views/Profile/Terms.dart';
import 'Views/Signin/Forget_Password.dart';
import 'Views/Signin/Reset_Password.dart';
import 'Views/Signin/SignUp.dart';
import 'Views/Signin/Verification.dart';
import 'Widgets/bottomNavigationBar.dart';
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
      home:SelectLocation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

