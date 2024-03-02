import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../Widgets/bottomNavigationBar.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray, width: 1),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColors.gray,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNavigationBar(),));
                },
              ),
            ),
          ),
          title: Text(
            "    My trips",
            style: TextStyle(
              color: AppColors.Black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body:Center(child: Text("My Trips"))
    );
  }
}
