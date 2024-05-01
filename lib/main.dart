import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/BookingScreens/BookingDetails/Booking_Details.dart';
import 'package:epic_expolre/Views/Maps/splash/onboarding_3.dart';
import 'package:epic_expolre/Views/Profile/profile_main.dart';
import 'package:epic_expolre/Views/States/alex/trips_screen.dart';
import 'package:epic_expolre/Views/WelcomeScreens/splash_screen.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Views/auth/SignUp.dart';
import 'package:epic_expolre/Widgets/states_tab_bar.dart';
import 'package:epic_expolre/core/api/dio_consumer.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Views/My_Trips/Add_Trip/add_trip.dart';
import 'Views/Place_Detials/detials_place_detials.dart';
import 'Views/Profile/AppMode.dart';
import 'Views/Profile/Edit_Profile.dart';
import 'Views/Profile/Settings.dart';
import 'Views/Profile/Terms.dart';
import 'Widgets/booking_tabBar.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'Widgets/trips_tabBar.dart';
import 'cache/cache_helper.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio()),),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Epic Explore',
          theme: ThemeData(
            primaryColor: Color(0xFF2F3C7E),
          ),
          home: BookingDetails(),
        );
      },
    );
  }
}