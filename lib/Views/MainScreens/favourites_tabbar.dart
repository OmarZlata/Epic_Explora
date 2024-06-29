import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';
import 'Favourite_Hotels.dart';
import 'favourites_Places.dart';

class FavTabBar extends StatelessWidget {
  const FavTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppColors.white,
          elevation: 1,
          title: Text(
            "Favourites",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
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

                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children:[
                    FavouriteHotelsScreen(),
                    FavouritsPlacesScreen(),


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
