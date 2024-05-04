import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/Widgets/app_bar.dart';

import '../Views/MainScreens/favourits/cubit.dart';
import '../Views/MainScreens/favourits/favourite_repo.dart';
import '../core/app_colors/app_colors.dart';
import '../core/models/hotel.dart';


class AppCard extends StatelessWidget {
  const AppCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(HotelRepository()),
      child: Scaffold(
        appBar: const AppAppBar(title: "Favorite"),
        body: BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is HotelLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HotelLoaded) {
              List<Hotel> hotels = state.hotels;
              return ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  Hotel hotel = hotels[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: 348.w,
                      height: 148.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              hotel.imageUrl.first,
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotel.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    hotel.address,
                                    style: TextStyle(
                                      color: AppColors.gray,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: AppColors.Blue,
                                      ),
                                      Text(
                                        "Alexandria ,Egypt",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.Blue,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$14.4",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Handle favorite tap
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.Red,
                                          size: 24.sp,
                                        ),
                                      ),
                                      Text(
                                        "294 Likes",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                      const SizedBox(width: 50),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/rate.png'),
                                          Text(
                                            "4.5",
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is HotelError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }
}
