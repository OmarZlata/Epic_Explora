import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/auth/Reset_Password.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/models/verification_model.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../core/app_colors/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool obscurePassword = true;
  int counter = 60;
  late Timer timer;
  bool isCounting = true;

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 70.h,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                  ),
                    child: Icon(
                  FontAwesomeIcons.circleXmark,
                      color: AppColors.red,
                )),
                SizedBox(height:15.h ,),
                AppText(
                  title: "Invalid OTP",
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Divider(color: AppColors.grey, height: 0.5),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInView(),));
              },
              child: Center(
                  child: AppText(
                    title: "Ok",
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        );
      },
    );
}
  @override
  Widget build(BuildContext context) {
    void startTimer() {
      setState(() {
        counter = 60;
      });
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          if (counter > 0) {
            counter--;
          } else {
            timer.cancel();
          }
        });
      });
    }
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
        },
        builder: (context, state) {

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppAppBar(
              title: 'Verification',
              actions: [
                // AppText(
                //   title: '${verificationModel.otp}',
                //   color: AppColors.blue,
                //
                //
                // ),
              ],
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          title: "Check email ",
                          fontSize: 17,
                          color: AppColors.grey,
                        ),
                        AppText(
                          title: '${context.read<UserCubit>().resetPasswordEmail.text}',
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )
                      ],
                    ),
                  ),
                  const AppText(
                    title: "inbox to verify your email",
                    fontSize: 17,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Form(
                      key: context.read<UserCubit>().VerificationFormkey,
                      child: Column(
                        children: [
                          AppTextField(
                            hint: "Enter Your OTP",
                            radius: 8,
                            icon: Icons.verified_user,
                            hintFontSize: 12,
                            obscureText: false,
                            maxLines: 1,
                            controller: context.read<UserCubit>().otp,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              }
                              else return "Invalid OTP";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  AppButton(
                    title: "Verify",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      print(CacheHelper().getData(key: ApiKey.token));
                      print("ttttt${context.read<UserCubit>().otp.text}");
                      if(CacheHelper().getData(key: ApiKey.token) == context.read<UserCubit>().otp.text){

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ResetPasswordScreen()));
                      }else return  _showAlertDialog(context);
                    },
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      AppText(title: "Haven't Received the verification code!?"),
                    SizedBox(height: 5,),
                      MaterialButton(
                      onPressed: () {
                        !isCounting;
                      },
                      child:
                      isCounting ? AppText(
                        title: 'Resend in $counter seconds',
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ): AppText(
                        title: 'Resend',
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      )
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
