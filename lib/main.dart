import 'package:flutter/material.dart';
import 'package:graduation_project/Views/My_Trips/Add_Trip/add_trip.dart';
import 'package:graduation_project/Views/My_Trips/alexandria_trip.dart';
import 'package:graduation_project/Views/My_Trips/map.dart';
import 'package:graduation_project/Views/Signin/Signin.dart';
import 'package:graduation_project/Views/WelcomeScreens/splash_screen.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Views/Place_Detials/place_details/detials_place_detials.dart';
import 'Views/Signin/Forget_Password.dart';
import 'Views/Signin/Reset_Password.dart';
import 'Views/Signin/SignUp.dart';
import 'Views/Signin/Verification.dart';
import 'core/local/app_local.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: const[
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      AppLocalizations.delegate
    ],
      supportedLocales: const [
        Locale('ar', "EG"),
        Locale('en', "US"),
      ],
      locale: const Locale('ar'),
      title: 'Splash Screen',
      theme: ThemeData(
      ),
      home: detialsPlaceDetials(),
      debugShowCheckedModeBanner: false,
    );
  }
}

