import 'package:epic_expolre/Views/Home/view.dart';
import 'package:epic_expolre/Views/Maps/google_map/view.dart';
import 'package:epic_expolre/Views/auth/SignUp.dart';
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
                padding: EdgeInsets.all(8),
                content: Text("Success" ,style: TextStyle(
                  color: AppColors.white,
                ),),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomeView(),
              ),
            );
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 1,
                backgroundColor: AppColors.blue,
                padding: EdgeInsets.all(8),
                content: Text("E-mail or Password are not correct",
                  style: TextStyle(
                    color: AppColors.white,
                  ),),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22,vertical:20 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppText(
                      title: "Sign in",
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset('assets/images/signup.png'),
                    ),
                    Column(
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
                        Form(
                          key: context.read<UserCubit>().signInFormKey,
                          child: Column(
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
                                    maxLines: 1,
                                    controller: context
                                        .read<UserCubit>()
                                        .signInPassword,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            log("Forget Password");
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
                              context.read<UserCubit>().signIn();
                            },
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: "Don’t have an Account?",
                          color: AppColors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ));
                          },
                          child: AppText(
                            title: "Sign Up",
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
