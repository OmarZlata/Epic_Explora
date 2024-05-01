import 'package:epic_expolre/Views/auth/Verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../core/app_colors/app_colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
              title: "Forget Password",
              color: AppColors.black,
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/am1ico.png',
                  ),
                ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Email",
                          color: AppColors.black,
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
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppButton(
                    title: "Continue",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VerificationScreen(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
