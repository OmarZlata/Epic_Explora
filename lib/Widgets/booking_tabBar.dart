import 'package:epic_expolre/Views/My_Trips/future.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:flutter/material.dart';

import '../Views/BookingScreens/future_booking.dart';
import '../Views/BookingScreens/present_booking.dart';
import '../Views/BookingScreens/previous_booking.dart';
import '../core/app_colors/app_colors.dart';
import 'app_text.dart';

class BookingTabBar extends StatefulWidget {
  const BookingTabBar({super.key});

  @override
  State<BookingTabBar> createState() => _BookingTabBarState();
}

class _BookingTabBarState extends State<BookingTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppAppBar(
          title: "   My Bookings",
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.gray.withOpacity(.2)),
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
                  PreviousBooking(),
                  PresentBooking(),
                  FutureBooking(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
