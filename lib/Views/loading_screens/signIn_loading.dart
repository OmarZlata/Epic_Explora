import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class SignInLoadingView extends StatelessWidget {
  const SignInLoadingView({super.key});

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
            AppText(title: "Sign In..",
            fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
