import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/app_text_field.dart';
import 'package:epic_expolre/Widgets/guide_Nav_Bar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GuiderSignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.blue,
              content: Center(
                child: AppText(
                  title: 'Registration Done',
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
        } else if (state is GuiderSignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.blue,
              content: Center(
                child: AppText(
                  title: 'Failed to Sign Up',
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
            child: Column(
              children: [
                AppText(
                  title: "Verification Code",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  hint: "Verification Code",
                  radius: 8,
                  icon: Icons.phone,
                  hintFontSize: 12,
                  obscureText: false,
                  textInputType: TextInputType.phone,
                  maxLines: 1,
                  controller: context.read<UserCubit>().OtpPhoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    if (value.length != 11 && value.length != 10) {
                      return 'Invalid Phone Number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
