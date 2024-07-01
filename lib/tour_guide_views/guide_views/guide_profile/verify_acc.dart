import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/app_text_field.dart';
import 'package:epic_expolre/Widgets/guide_Nav_Bar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  final GlobalKey<FormState> VerificationCodeFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is VerifyAccSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.blue,
              content: Center(
                child: AppText(
                  title: 'Registration Done',
                  color: AppColors.white,
                ),
              ),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GuideNavBar(),
            ),
          );
        } else if (state is VerifyAccFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Center(
                child: AppText(
                  title: 'Failed to Sign Up',
                  color: AppColors.white,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppAppBar(
            color: AppColors.violet,
            title: "Verify Your Account",
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    title: "Verification Code",
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextField(
                    hint: "Verification Code",
                    radius: 12.r,
                    icon: Icons.phone,
                    hintFontSize: 14.sp,
                    obscureText: false,
                    textInputType: TextInputType.phone,
                    maxLines: 1,
                    controller: context.read<UserCubit>().OtpPhoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the verification code';
                      }
                      if (value.length != 6) {
                        return 'Invalid verification code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  state is VerifyAccLoading
                      ? CircularProgressIndicator(
                    color: AppColors.blue,
                  )
                      : AppButton(
                    color: AppColors.violet,
                    font_color: AppColors.white,
                    title: "Verify",
                    onTap: () {
                      if (VerificationCodeFormKey.currentState!
                          .validate()) {
                        VerificationCodeFormKey.currentState!.save();
                        context.read<UserCubit>().VerifyAcc();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
