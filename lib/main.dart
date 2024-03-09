import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Views/MainScreens/home_screen.dart';
import 'Views/MainScreens/select_location.dart';
import 'Views/Profile/AppMode.dart';
import 'Views/Profile/Settings.dart';
import 'Views/Profile/Terms.dart';
import 'Views/Signin/Forget_Password.dart';
import 'Views/Signin/Reset_Password.dart';
import 'Views/Signin/SignUp.dart';
import 'Views/Signin/Verification.dart';
import 'Widgets/booking_tabBar.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'Widgets/trips_tabBar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Epic Explore',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BookingTabBar(),
        );
      },
    );
  }
}