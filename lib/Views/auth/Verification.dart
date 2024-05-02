import 'package:epic_expolre/Views/auth/Reset_Password.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppAppBar(
              title: 'Verification',
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      'assets/images/amico3.png',
                    ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
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
                  const AppText(
                    title: "inbox to verify your email",
                    fontSize: 17,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: AppTextField(
                      hint: "Enter Your Otp",
                      radius: 8,
                      icon: Icons.verified_user,
                      hintFontSize: 12,
                      obscureText: false,
                      maxLines: 1,
                      controller:
                      context.read<UserCubit>().otp,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        }
                        else return "Invalid OTP";
                      },
                    ),
                  ),
                  SizedBox(height: 40,),
                  AppButton(
                    title: "Verify",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {


                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ));
                    },
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      AppText(title: "Haven't Received the verification code!? "),
                    SizedBox(height: 5,),
                      GestureDetector(
                      onTap: () {
                        print('Done ');
                      },
                      child: AppText(
                        title: "Resend",
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
