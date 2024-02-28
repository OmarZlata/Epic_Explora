import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
        body:Center(child: Text("My Trips"))
    );
  }
}
