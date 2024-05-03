import 'package:epic_expolre/Views/Home/view.dart';
import 'package:epic_expolre/Views/Maps/google_map/view.dart';
import 'package:epic_expolre/Views/Profile/profile_main.dart';
import 'package:epic_expolre/Views/auth/Forget_Password.dart';
import 'package:epic_expolre/Views/auth/SignUp.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widgets/app_text.dart';
import '../../../Widgets/app_text_field.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../Widgets/app_button.dart';
import '../../cubit/user_cubit.dart';
import 'dart:developer';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool obscurePassword = true;
  final signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.blue,
                elevation: 1,
                content: Center(
                  child: Text("Success" ,style: TextStyle(
                    color: AppColors.white,
                  ),),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileMainScreen(),
              ),
            );
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 1,
                backgroundColor: AppColors.blue,
                padding: EdgeInsets.all(8),
                content: Center(
                  child: Text("E-mail or Password are not correct",
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
            appBar:AppAppBar(
              title: "Sign in",
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22,vertical:20 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                     Center(
                      child: Image.asset('assets/images/signup.png'),
                    ),
                    Form(
                      key: signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            title: "Email",
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              AppTextField(
                                hint: "Email",
                                radius: 8,
                                icon: Icons.email_outlined,
                                hintFontSize: 12,
                                obscureText: false,
                                maxLines: 1,
                                controller:
                                    context.read<UserCubit>().signInEmail,
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
                              SizedBox(height: 23),
                              Column(
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
                                        color: obscurePassword ?AppColors.grey:AppColors.blue,
                                        obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    obscureText: obscurePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters long';
                                      }
                                      return null;
                                    },
                                    maxLines: 1,
                                    controller: context
                                        .read<UserCubit>()
                                        .signInPassword,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                          },
                          child: AppText(
                              title: "Forget Password",
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    state is SignInLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.blue,
                            ),
                          )
                        : AppButton(
                            color: AppColors.blue,
                            font_color: AppColors.white,
                            title: "Sign in",
                            onTap: () {
                              if (signInFormKey.currentState!.validate()) {
                                signInFormKey.currentState!.save();
                                context.read<UserCubit>().signIn();
                                print('Email: ${context.read<UserCubit>().signInEmail}');
                                print('Password: ${context.read<UserCubit>().signInPassword}');
                              }
                            },
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: "Don’t have an Account ?",
                          color: AppColors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ));
                          },
                          child: AppText(
                            title: " Sign Up",
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
