import 'package:epic_expolre/Views/auth/Reset_Password.dart';
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
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
              title: "Verification",
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
              'assets/images/amico3.png',
            ),
          ),
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
                            color: AppColors.grey,
                          ),
                          AppText(
                            title: 'Mohammed@gmail.com',
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )
                        ],
                      ),
                      AppText(
                        title: "inbox to verify your email",
                        fontSize: 17,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240,
                ),
                AppButton(
                  title: "Verify",
                  color: AppColors.blue,
                  font_color: AppColors.white,
                  onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordScreen(),));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
