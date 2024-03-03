import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/Views/My_Trips/present.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

import 'future.dart';

class previous extends StatefulWidget {
  const previous({super.key});

  @override
  State<previous> createState() => _previousState();
}

class _previousState extends State<previous>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:70,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
        ),
        title: const Text(
          "My Trips",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        bottom: customTabBar(),
      ),

      body: TabBarView(

        controller: _tabController,
        children: <Widget>[
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.Green,
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
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: AppColors.Red,
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
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: AppColors.Green,
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
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: AppColors.Red,
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


                    ],
                  ),
                ],
              ),

            ),
          ),
          const Present(),
          const Futuree(),
        ],
      ),
    );
  }

  TabBar customTabBar() {
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.Blue
      ),
      controller: _tabController,
      labelColor: AppColors.white,
      indicatorColor: AppColors.Blue,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: const Color(0xff787878),
      dividerColor: const Color(0xffB2B2B2),
      tabs: const <Widget>[
        Tab(
          child: Text(
            "Previous",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        Tab(
          child: Text(
            "Present",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        Tab(
          child: Text(
            "Future",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16,),
          ),
        ),
      ],
    );
  }
}
