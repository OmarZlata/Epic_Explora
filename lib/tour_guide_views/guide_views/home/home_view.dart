import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuideHomeView extends StatelessWidget {
  const GuideHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppAppBar(
            title: "Tour Guide Home",
            textColor: AppColors.black,
            iconThemeColor: AppColors.black,

          ),
          body: ListView.builder(
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.violet.withOpacity(.12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/classic lorem.png",
                            width: 104,
                            height: 104,
                            fit: BoxFit.cover,
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
                              "Cairo International Stadium",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.location_city_rounded,
                                  size: 18,
                                  color: AppColors.blue,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Cairo",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                             SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text("Requst From : Omar"),
                                SizedBox(width: 50,),
                                Container(
                                  width: 50,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.green,
                                  ),
                                  child: const Center(
                                      child: Text(
                                    " Done ",
                                    style: TextStyle(
                                        fontSize: 15, color: AppColors.white),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text("Phone Number : 0261537625")
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 14,)
              ],
            ),
            itemCount: 10,
            
          )),
    );
  }
}
