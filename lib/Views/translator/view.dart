import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TranslatorView extends StatelessWidget {
  const TranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          title: AppText(title: "Translator", fontSize: 20),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    AppText(title:"Arabic",fontWeight: FontWeight.bold),
                    Spacer(),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                            FontAwesomeIcons.arrowRightArrowLeft,color: AppColors.blue,
                        ),
                      ),
                    ),
                    Spacer(),
                    AppText(title: "English",fontWeight: FontWeight.bold,color: AppColors.grey),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
