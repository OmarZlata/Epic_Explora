import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';

class PresentScreen extends StatelessWidget {
  const PresentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.grey.withOpacity(0.05),
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
                                      color: AppColors.blue,
                                    ),
                                    SizedBox(width: 3,),
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
                                      color: AppColors.blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 55,
                                    ),
                                    Container(
                                      width: 71,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: AppColors.blue,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "On Time ",
                                            style: TextStyle(fontSize: 15,color:AppColors.white),
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
                    SizedBox(height: 12,),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.grey.withOpacity(0.05),
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
                                      color: AppColors.blue,
                                    ),
                                    SizedBox(width: 3,),
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
                                      color: AppColors.blue,
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
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: AppColors.red,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Cancelled ",
                                            style: TextStyle(fontSize: 15,color:AppColors.white),
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
                    SizedBox(height: 12,),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.grey.withOpacity(0.05),
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
                                      color: AppColors.blue,
                                    ),
                                    SizedBox(width: 3,),
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
                                      color: AppColors.blue,
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
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: AppColors.green,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "Done ",
                                            style: TextStyle(fontSize: 15,color:AppColors.white),
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
                    SizedBox(height: 12,),
                    Container(
                      width: 327,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.grey.withOpacity(0.05),
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
                                      color: AppColors.blue,
                                    ),
                                    SizedBox(width: 3,),
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
                                      color: AppColors.blue,
                                    ),
                                    const Text(
                                      "15 days",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 44,
                                    ),
                                    Container(
                                      width: 84,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: AppColors.mediumBlue,
                                      ),
                                      child: const Center(
                                          child: Text(
                                            "upcoming ",
                                            style: TextStyle(fontSize: 15,color:AppColors.white),
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
        ),
      ],
    );
  }
}
