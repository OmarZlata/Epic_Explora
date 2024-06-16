import 'package:epic_expolre/Views/user_gallary/viewAswan.dart';
import 'package:epic_expolre/Views/user_gallary/viewCairo.dart';
import 'package:epic_expolre/Views/user_gallary/viewRedsea.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'viewAlex.dart';

class UserGallery extends StatefulWidget {
  const UserGallery({super.key});

  @override
  _UserGalleryState createState() => _UserGalleryState();
}

class _UserGalleryState extends State<UserGallery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            AppText(
              title: 'Trips Gallery',
              color: AppColors.white,
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    AppText(title: "Cairo",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.blue,),
                    SizedBox(height: 6,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CairoGallery(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/images/CairoG.jpg',
                            fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    AppText(title: "RedSea",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.blue),
                    SizedBox(height: 6,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RedSeaGallery(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/images/RedSeaG.jpg',
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14,),
                    AppText(title: "Aswan",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.blue),
                    SizedBox(height: 6,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AswanGallery(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/images/aswanG.jpg',
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14,),
                    AppText(title: "Alexandria",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.blue),
                    SizedBox(height: 6,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlexGallery(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/images/alexG.jpg',
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
