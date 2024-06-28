import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class OurGuiders extends StatefulWidget {
  const OurGuiders({super.key});

  @override
  State<OurGuiders> createState() => _OurGuidersState();
}

class _OurGuidersState extends State<OurGuiders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppAppBar(
            title: "Our Guiders",
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
                    color: AppColors.black.withOpacity(.12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/profilepic.jfif",
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
                              "Ahmed Abdallah",
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
                                  "Aswan Guider",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.green,
                                  ),
                                  child: const Center(
                                      child: Text(
                                        "  Available  ",
                                        style: TextStyle(
                                            fontSize: 15, color: AppColors.white),
                                      )),
                                )
                              ],
                            )
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