
import 'package:flutter/material.dart';

import '../core/app_colors/app_colors.dart';



class TripsTabBar extends StatefulWidget {
  const TripsTabBar({super.key});

  @override
  State<TripsTabBar> createState() => _TripsTabBarState();
}

class _TripsTabBarState extends State<TripsTabBar> {
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
                  color: AppColors.Black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: [
              DropdownButton(
                padding: EdgeInsets.only(right: 16),
                elevation: 0,
                icon: Icon(Icons.menu),
                iconSize: 32,
                items:
                <String>['Add Trip'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        // Adjust the spacing between icon and text
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {},
              )
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.gray.withOpacity(0.05),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/trip photo.png",
                                width: 104,
                                height: 104,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Alexandria Trip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Mon,Nov 20 18 - Fri,Nov 2018",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_alarm_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 75,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.Green,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Done ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.white),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.gray.withOpacity(0.05),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/trip photo.png",
                                width: 104,
                                height: 104,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Alexandria Trip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Mon,Nov 20 18 - Fri,Nov 2018",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_alarm_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 46,
                                    ),
                                    Container(
                                      width: 83,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.Red,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Cancelled ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.white),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.gray.withOpacity(0.05),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/trip photo.png",
                                width: 104,
                                height: 104,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Alexandria Trip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Mon,Nov 20 18 - Fri,Nov 2018",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_alarm_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 75,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.Green,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Done ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.white),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.gray.withOpacity(0.05),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/trip photo.png",
                                width: 104,
                                height: 104,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Alexandria Trip",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Mon,Nov 20 18 - Fri,Nov 2018",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_alarm_outlined,
                                      size: 18,
                                      color: AppColors.Blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 46,
                                    ),
                                    Container(
                                      width: 83,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.Red,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Cancelled ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.white),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
