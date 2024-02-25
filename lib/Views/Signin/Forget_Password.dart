import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/Widgets/app_text.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();

  Widget Image_() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        'assets/images/am1ico.png',
      ),
    );
  }
  Widget EmailTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Email",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,

          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(
            hint: "Email",
            radius: 8,
            icon: Icons.email_outlined,
            hintFontSize: 12,
            obscureText: false,
            maxLines: 1,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email can't be empty";
              }
              final emailRegex = RegExp(
                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
              if (!emailRegex.hasMatch(value)) {
                return "Invalid email address";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
  Widget ContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        title: "Continue",
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
            title: "Forget Password",
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
                padding: const EdgeInsets.all(10.0),
                child: AppText(
                  title: "Enter your email to receive reset Code",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: EmailTextField(),
              ),
              SizedBox(height: 120,),
              ContinueButton()

            ],
          ),
        ),
      ),
    );
  }
}
