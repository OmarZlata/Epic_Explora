import 'package:flutter/material.dart';
import 'Views/MainScreens/home_screen.dart';
import 'Views/MainScreens/search_screen.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'Views/MainScreens/select_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: bottomNavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

