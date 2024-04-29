import 'package:flutter/material.dart';
import '../../Widgets/app_ListTile.dart';
import '../../Widgets/app_text.dart';
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
        color: AppColors.blue,
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
        color: AppColors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.grey),
        title: AppText(
            title: "Settings",
            color: AppColors.black,
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
