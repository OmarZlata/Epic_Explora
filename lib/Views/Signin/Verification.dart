import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../core/app_colors/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();

  Widget Image_() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        'assets/images/amico3.png',
      ),
    );
  }

  Widget ContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        title: "Verify",
        color: AppColors.Blue,
        font_color: AppColors.white,
        onTap: () {
          final email = emailController.text;
          // Perform sign-in logic with email and password
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "Verification",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image_(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          title: "Check email ",
                          fontSize: 17,
                          color: AppColors.gray,
                        ),
                        AppText(
                          title: 'Mohammed@gmail.com',
                          color: AppColors.Blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )
                      ],
                    ),
                    AppText(
                      title: "inbox to verify your email",
                      fontSize: 17,
                      color: AppColors.gray,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 240,
              ),
              ContinueButton()
            ],
          ),
        ),
      ),
    );
  }
}
