import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/BookingScreens/BookingDetails/Booking_Details.dart';
import 'package:epic_expolre/Views/BookingScreens/future_booking.dart';
import 'package:epic_expolre/Views/Maps/google_map/view.dart';
import 'package:epic_expolre/Views/Maps/splash/onboarding_3.dart';
import 'package:epic_expolre/Views/Profile/profile_main.dart';
import 'package:epic_expolre/Views/States/Aswan/Aswan_tab_bar.dart';
import 'package:epic_expolre/Views/States/alex/Alex_tab_bar.dart';
import 'package:epic_expolre/Views/States/alex/trips_screen.dart';
import 'package:epic_expolre/Views/WelcomeScreens/splash_screen.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Views/auth/SignUp.dart';
import 'package:epic_expolre/Views/user_gallary/home.dart';
import 'package:epic_expolre/Views/user_gallary/viewAswan.dart';
import 'package:epic_expolre/Widgets/states_tab_bar.dart';
import 'package:epic_expolre/core/api/dio_consumer.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Views/Home/view.dart';
import 'Views/My_Trips/Add_Trip/add_trip.dart';
import 'Views/Place_Detials/detials_place_detials.dart';
import 'Views/Profile/AppMode.dart';
import 'Views/Profile/Edit_Profile.dart';
import 'Views/Profile/Settings.dart';
import 'Views/Profile/Terms.dart';
import 'Widgets/booking_tabBar.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'Widgets/Guider/trips_tabBar.dart';
import 'cache/cache_helper.dart';
import 'generated/l10n.dart';
import 'tour_guide_views/Auth/guide_signUp.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('ar');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: _locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Epic Explore',
          theme: ThemeData(
            primaryColor: Color(0xFF2F3C7E),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
