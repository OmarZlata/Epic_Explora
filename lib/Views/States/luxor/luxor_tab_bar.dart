
import 'package:epic_expolre/Views/States/luxor/luxor_Restaurant.dart';
import 'package:epic_expolre/Views/States/luxor/luxor_banks.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'luxor_hotels.dart';
import 'luxor_places.dart';


class LuxorTabbar extends StatelessWidget {
  const LuxorTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppColors.white,
          elevation: 1,
          title: Text(
            "Luxor",
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
                  borderRadius: BorderRadius.circular(12),

                ),
                child: TabBar(
                  indicatorPadding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                  indicator: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.black,
                  tabs: [
                    Tab(
                        child: Icon(Icons.hotel)
                    ),
                    Tab(
                      child: Icon(Icons.place),
                    ),
                    Tab(
                      child: Icon(Icons.restaurant),
                    ),
                    Tab(
                        child: Icon(Icons.monetization_on)
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    LuxorHotelsView(),
                    LuxorPlacesScreen(),
                    LuxorRestaurantsScreen(),
                    LuxorBanksScreen()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
