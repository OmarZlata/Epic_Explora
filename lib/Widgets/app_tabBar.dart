import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../Views/My_Trips/future.dart';
import '../Views/My_Trips/present.dart';
import '../Views/My_Trips/previous.dart';
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 1,
          title: Text(
            "My Trips",
            style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.gray.withOpacity(.3)),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: Colors.black,
                  indicatorColor: AppColors.white,
                  tabs: [
                    Tab(
                        child: AppText(
                      title: 'Previous',
                    )),
                    Tab(
                        child: AppText(
                      title: 'Present',
                    )),
                    Tab(
                        child: AppText(
                      title: 'Future',
                    )),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  PreviousScreen(),
                  PresentScreen(),
                  FutureScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
