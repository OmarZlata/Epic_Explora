import 'package:epic_expolre/Views/Home/view.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Widgets/app_button.dart';
import '../../../Widgets/app_text.dart';
import '../../../Widgets/app_text_field.dart';
import '../../../core/app_colors/app_colors.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Widget EmailTextField(dynamic signUpEmailController) {
    return Container(
      padding: EdgeInsets.all(16),
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
            controller: emailController,
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
    );
  }

  Widget NameTextField(dynamic nameController) {
    return Container(
      padding: EdgeInsets.all(16),
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
          ),
        ],
      ),
    );
  }

  Widget PasswordTextField(dynamic signUpPassword) {
    return Container(
      padding: EdgeInsets.all(16),
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
            controller: passwordController,
          ),
        ],
      ),
    );
  }

  Widget ConfirmPasswordTextField(dynamic signUpConfirmPassword) {
    return Container(
      padding: EdgeInsets.all(16),
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
            hint: "Password",
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
                obscurePasswordConfirm ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: obscurePassword,
            maxLines: 1,
            controller: passwordController,
          ),
        ],
      ),
    );
  }

  Widget SiginUpButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppButton(
        border_color: AppColors.white,
        font_color: AppColors.white,
        color: isChecked ? AppColors.blue : AppColors.grey.withOpacity(.7),
        // Change button color based on isChecked
        title: "Sign Up",
        onTap: isChecked
            ? () {
                final email = emailController.text;
                final password = passwordController.text;
                // context.read<UserCubit>().signUp();

              }
            : null,
      ),
    );
  }

  Widget Terms() {
    return Row(
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
            onPressed: () {},
            child: AppText(
              title: "Terms & Conditions",
              color: AppColors.blue,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        BlocProvider.of<UserCubit>(context).signUpName;
    TextEditingController signUpEmailController =
        BlocProvider.of<UserCubit>(context).signUpEmail;
    TextEditingController signUpPassword =
        BlocProvider.of<UserCubit>(context).signUpPassword;
    TextEditingController signUpConfirmPassword =
        BlocProvider.of<UserCubit>(context).signUpPassword;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),
              ),
            );
            context.read<UserCubit>().signIn();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          } else if (state is SignInFailure) {
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
              child: Column(
                children: [
                  AppText(
                    title: "Sign Up",
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                    fontSize: 24,
                  ),
                  SizedBox(height: 20,),
                  Image.asset('assets/images/amico.png'),
                  NameTextField(nameController),
                  EmailTextField(signUpEmailController),
                  PasswordTextField(signUpPassword),
                  ConfirmPasswordTextField(signUpConfirmPassword),
                  Terms(),
                  SiginUpButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


