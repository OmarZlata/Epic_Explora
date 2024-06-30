import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_text.dart';
import '../../Widgets/app_tileWithButton.dart';
import '../../core/app_colors/app_colors.dart';
import '../../generated/l10n.dart';
import '../../main.dart';

class LocaleSwitchScreen extends StatefulWidget {
  const LocaleSwitchScreen({Key? key}) : super(key: key);

  @override
  _LocaleSwitchScreenState createState() => _LocaleSwitchScreenState();
}

class _LocaleSwitchScreenState extends State<LocaleSwitchScreen> {
  bool isEnglishSelected = true;
  bool isArabicSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "Select Language",
            color: AppColors.black,
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
              iconData: CupertinoIcons.globe,
              title: S.of(context).english,
              isSelected: isEnglishSelected,
              onSelect: (isSelected) {
                setState(() {
                  isEnglishSelected = isSelected;
                  isArabicSelected = !isSelected;
                  _changeLocale(context, Locale('en'));
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTileWithButton(
              iconData: CupertinoIcons.globe,
              title: S.of(context).arabic,
              isSelected: isArabicSelected,
              onSelect: (isSelected) {
                setState(() {
                  isArabicSelected = isSelected;
                  isEnglishSelected = !isSelected;
                  _changeLocale(context, Locale('ar'));
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _changeLocale(BuildContext context, Locale locale) {
    MyApp.setLocale(context, locale);
  }
}
