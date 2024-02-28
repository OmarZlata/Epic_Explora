import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/app_text.dart';

import '../../Widgets/app_ListTile.dart';
import '../../core/app_colors/app_colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  Widget Mode() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "App Mode",
        icon: Icons.wb_sunny_outlined,
        onPressed: () {},
        color: AppColors.Blue,
      ),
    );
  }

  Widget Language() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "App Language",
        icon: Icons.language,
        onPressed: () {},
        color: AppColors.Blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "Settings",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: Center(
          child: Column(
        children: [SizedBox(height: 20,),Mode(), Language()],
      )),
    );
  }
}
