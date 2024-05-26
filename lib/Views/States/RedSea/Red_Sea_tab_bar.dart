import 'package:epic_expolre/Views/States/alex/places_screen.dart';
import 'package:epic_expolre/Views/States/alex/Alex_hotels_screen.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'Red_Sea_Hotels.dart';
import 'Red_Sea_Places.dart';




class RedSeaTabbar extends StatelessWidget {
  const RedSeaTabbar({super.key});

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
            "Red Sea",
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
                    color: AppColors.grey.withOpacity(.2)),
                child: TabBar(
                  indicatorPadding: EdgeInsets.only(left:15 ,right:15,top: 6,bottom: 6,),
                  splashBorderRadius: BorderRadius.circular(12),
                  indicator: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.black,
                  tabs: [
                    Tab(
                        child: AppText(
                          title: 'Hotels',
                        )),
                    Tab(
                        child: AppText(
                          title: 'Places  ',
                        )),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  RedSeaHotelsView(),
                  RedSeaPlacesScreen(),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
