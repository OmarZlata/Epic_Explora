import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.gray, width: 1),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.gray,
              ),
              onTap: () {
                print("Back");
              },
            ),
          ),
        ),
        title: Text(
          "    Favorite",
          style: TextStyle(
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(height: 24,),
            Container(
              child: Center(
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 348,
                    height: 148,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/JulyGetaway.png'),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Classic Lorem ipsum"),
                                    SizedBox(
                                      width: 36,
                                    ),
                                    InkWell(
                                      child: Image.asset('assets/images/dots.png'),
                                      onTap: () {
                                        print("Delete");
                                      },
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                Text("dolor"),
                                SizedBox(
                                  height: 4,
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
                                          fontSize: 12, color: AppColors.gray),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.Blue,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text("\$14.4"),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite, color: Colors.red),
                                        Text(
                                          "294 Likes",
                                          style: TextStyle(
                                              fontSize: 12, color: AppColors.gray),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/rate.png'),
                                        Text("4.5"),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
          ],

        ),
        itemCount: 20,

      ),
    );
  }
}
