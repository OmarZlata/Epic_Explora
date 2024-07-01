import 'package:epic_expolre/Views/Home/view.dart';
import 'package:epic_expolre/Views/Maps/google_map/view.dart';
import 'package:epic_expolre/Views/Profile/Terms.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/bottomNavigationBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/app_button.dart';
import '../../../Widgets/app_text.dart';
import '../../../Widgets/app_text_field.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../generated/l10n.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isChecked = false;
  bool isDisabled = false ;
  final signUpFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                backgroundColor: AppColors.blue,
                content: Center(child: AppText( title: S.of(context).registrationDone,)),
              ),
            );
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>  SignInView(),
            ),);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.blue,
                content: Center(child: AppText( title: S.of(context).signUpFail,)),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar:  AppAppBar(
              title: S.of(context).signUp,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
              child: Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    Image.asset('assets/images/amico.png'),
                    SizedBox(height: 14.h,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: S.of(context).fullName,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppTextField(
                            hint:S.of(context).name,
                            radius: 8,
                            enabled: !isDisabled,
                            icon: Icons.person,
                            hintFontSize: 12,
                            obscureText: false,
                            maxLines: 1,
                            controller: context.read<UserCubit>().signUpName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).enterName;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 14.h,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title:S.of(context).email,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppTextField(
                                  hint: S.of(context).email,
                                  radius: 8,
                                  enabled: !isDisabled,
                                  icon: Icons.email_outlined,
                                  hintFontSize: 12,
                                  obscureText: false,
                                  maxLines: 1,
                                  controller: context.read<UserCubit>().signUpEmail,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return S.of(context).emailEmpty;
                                    }
                                    final emailRegex =
                                    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                    if (!emailRegex.hasMatch(value)) {
                                      return S.of(context).invalidEmail;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: S.of(context).password,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                AppTextField(
                                  hint: S.of(context).password,
                                  radius: 8,
                                  enabled: !isDisabled,
                                  icon: Icons.lock_outline,
                                  hintFontSize: 12,
                                  suffixicon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      color: obscurePassword ? AppColors.grey : AppColors.blue,
                                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    ),
                                  ),
                                  obscureText: obscurePassword,
                                  maxLines: 1,
                                  controller: context.read<UserCubit>().signUpPassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return S.of(context).enterPassword;
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters long';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h,),
                          Container(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: S.of(context).confirmPassword,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),

                                AppTextField(
                                  hint: S.of(context).confirmPassword,
                                  radius: 8,
                                  enabled: !isDisabled,
                                  icon: Icons.lock_outline,
                                  hintFontSize: 12,
                                  suffixicon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscurePasswordConfirm = !obscurePasswordConfirm;
                                      });
                                    },
                                    icon: Icon(
                                      color: obscurePasswordConfirm ? AppColors.grey : AppColors.blue,
                                      obscurePasswordConfirm
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  obscureText: obscurePasswordConfirm,
                                  maxLines: 1,
                                  controller: context.read<UserCubit>().confirmPassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value != context.read<UserCubit>().signUpPassword.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: AppColors.blue,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },

                        ),
                        AppText(
                          title: S.of(context).agree,
                          color: AppColors.black,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsScreen(),));
                            },
                            child: AppText(
                              title: S.of(context).termsConditions,
                              color: AppColors.blue,
                            ))
                      ],
                    ),
                    state is SignUpLoading?
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blue,
                      ),
                    ):
                    AppButton(
                      border_color: AppColors.white,
                      font_color: AppColors.white,
                      color: isChecked ? AppColors.blue : AppColors.grey.withOpacity(.3),
                      title: S.of(context).signUp,
                      onTap: isChecked
                          ? () {
                        if (signUpFormKey.currentState!.validate()) {
                          context.read<UserCubit>().signUp();
                          context.read<UserCubit>().signUpName.clear();
                          context.read<UserCubit>().signInEmail.clear();
                          context.read<UserCubit>().signUpPassword.clear();
                          context.read<UserCubit>().confirmPassword.clear();
                          isDisabled=!isDisabled;
                          }
                      } : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
