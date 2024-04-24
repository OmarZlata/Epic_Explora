import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpLoadingView extends StatelessWidget {
  const SignUpLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CircularProgressIndicator(
              color: AppColors.blue,
            ),
            SizedBox(height: 20 ,),
            AppText(title: "Sign up..",fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
