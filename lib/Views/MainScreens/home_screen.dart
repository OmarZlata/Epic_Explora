import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60,right: 24,left: 24),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile.png'),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Text("Hi,Mohammed Hassan",style: TextStyle(fontSize: 12),),
                    Row(
                      children: [
                       Icon(Icons.location_on_outlined,color: AppColors.Blue,),
                        Text("Alexandria ,Egypt",style: TextStyle(fontSize: 12,color: AppColors.gray),),
                        Icon(Icons.arrow_drop_down,color: AppColors.Blue,),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(child: Image.asset('assets/images/Notification-icon.png'),
                onTap: () {
                },),
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Container(
                  width: 285 ,
                  height: 60,
                  child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.Blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    child: Image.asset('assets/images/filters-2.png'),
                    onTap: () {
                      print("Fillter");
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
