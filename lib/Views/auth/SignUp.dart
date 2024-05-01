import 'package:epic_expolre/Views/Home/view.dart';
import 'package:epic_expolre/Views/Maps/google_map/view.dart';
import 'package:epic_expolre/Views/Profile/Terms.dart';
import 'package:epic_expolre/Widgets/bottomNavigationBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Widgets/app_button.dart';
import '../../../Widgets/app_text.dart';
import '../../../Widgets/app_text_field.dart';
import '../../../core/app_colors/app_colors.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const bottomNavigationBar(),
              ),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AppText(
                    title: "Sign Up",
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                    fontSize: 24,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/amico.png'),
                  SizedBox(height: 24,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Full Name",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppTextField(
                          hint: "Name",
                          radius: 8,
                          icon: Icons.person,
                          hintFontSize: 12,
                          obscureText: false,
                          maxLines: 1,
                          controller: context.read<UserCubit>().signUpName,
                        ),
                        SizedBox(height: 24,),
                        Container(
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
                                controller: context.read<UserCubit>().signUpEmail,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email can't be empty";
                                  }
                                  final emailRegex =
                                  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return "Invalid email address";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Password",
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppTextField(
                                hint: "Password",
                                radius: 8,
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24,),
                        Container(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Confirm Password",
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppTextField(
                                hint: "Confirm Password",
                                radius: 8,
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
                        title: "I agree",
                        color: AppColors.black,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsScreen(),));
                          },
                          child: AppText(
                            title: "Terms & Conditions",
                            color: AppColors.blue,
                          ))
                    ],
                  ),
                  state is SignInLoading?
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                  ):
                  AppButton(
                    border_color: AppColors.white,
                    font_color: AppColors.white,
                    color: isChecked ? AppColors.blue : AppColors.grey.withOpacity(.3),
                    title: "Sign Up",
                    onTap: isChecked
                        ? () {
                      context.read<UserCubit>().signUp();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleMapsView(),));
                    } : null,
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
