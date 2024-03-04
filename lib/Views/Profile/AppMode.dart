import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Widgets/app_text.dart';
import '../../Widgets/app_tileWithButton.dart';
import '../../core/app_colors/app_colors.dart';

class AppModeScreen extends StatefulWidget {
  const AppModeScreen({Key? key}) : super(key: key);

  @override
  _AppModeScreenState createState() => _AppModeScreenState();
}

class _AppModeScreenState extends State<AppModeScreen> {
  bool isDarkModeSelected = true;
  bool isLightModeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "App Mode",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTileWithButton(
              iconData: CupertinoIcons.moon,
              title: 'Dark Mode',
              isSelected: isDarkModeSelected,
              onSelect: (isSelected) {
                setState(() {
                  isDarkModeSelected = isSelected;
                  isLightModeSelected = !isSelected;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTileWithButton(
              iconData: CupertinoIcons.sun_max,
              title: 'Light Mode',
              isSelected: isLightModeSelected,
              onSelect: (isSelected) {
                setState(() {
                  isLightModeSelected = isSelected;
                  isDarkModeSelected = !isSelected;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
