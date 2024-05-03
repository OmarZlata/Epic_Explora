import 'package:epic_expolre/Views/auth/Verification.dart';
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

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  bool obscurePassword = true;
  final ForgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.blue,
                elevation: 1,
                content: Center(
                  child: Text("Check your E-mail" ,style: TextStyle(
                    color: AppColors.white,
                  ),),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  VerificationScreen(),
              ),
            );
          } else if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 1,
                backgroundColor: AppColors.blue,
                padding: EdgeInsets.all(8),
                content: Center(
                  child: Text("E-mail are not correct",
                    style: TextStyle(
                      color: AppColors.white,
                    ),),
                ),
              ),
            );
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppAppBar(
                title: 'Forget Password'
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Image.asset(
                    'assets/images/am1ico.png',
                  ),
                  const SizedBox(height: 10,),
                  const AppText(
                    title: "Enter your email to receive reset Code",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 35,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        Form(
                          // key: ForgetPasswordFormKey,
                          child: AppTextField(
                            hint: "Email",
                            radius: 8,
                            icon: Icons.email_outlined,
                            hintFontSize: 12,
                            obscureText: false,
                            maxLines: 1,
                            controller: context.read<UserCubit>().resetPasswordEmail,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  state is ForgetPasswordLoading?Center(child: CircularProgressIndicator(
                    color: AppColors.blue,
                  ),):
                  AppButton(
                    title: "Continue",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      context.read<UserCubit>().forgotPassword();
                      // if (ForgetPasswordFormKey.currentState!.validate()) {
                      //   ForgetPasswordFormKey.currentState!.save();
                      //   context.read<UserCubit>().forgotPassword();
                      // }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
