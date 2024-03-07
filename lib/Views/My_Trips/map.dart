import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

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
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        title: Text(
          "    Map",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/sanaa map .png'),
                fit: BoxFit.cover
            )
        ),
      )
    );
  }
}
