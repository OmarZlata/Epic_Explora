import 'package:flutter/material.dart';

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
  bool isChecked = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Widget EmailTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Email",
            color: AppColors.Black,
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
              final emailRegex = RegExp(
                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
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
  Widget NameTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Full Name",
            color: AppColors.Black,
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


  Widget PasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Password",
            color: AppColors.Black,
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
  Widget ConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Confirm Password",
            color: AppColors.Black,
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
  Widget SiginUpButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        title: "Sign Up",
        onTap: () {
          final email = emailController.text;
          final password = passwordController.text;
          // Perform sign-in logic with email and password
        },
      ),
    );
  }
  Widget Terms(){
    return Row(
      children: [Checkbox(value: isChecked, activeColor: AppColors.Blue,onChanged: (value) {
        setState(() {
          isChecked = value!;

        });
      },),
        AppText(title: "I agree",color: AppColors.Black,),TextButton(onPressed: () {

        }, child: AppText(title: "Terms & Conditions",color: AppColors.Blue,))
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: AppText(title: "Sign Up",fontWeight: FontWeight.bold,color: AppColors.Black,fontSize: 24),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          NameTextField(),
          EmailTextField(),
          PasswordTextField(),
          ConfirmPasswordTextField(),
          Terms(),
          SiginUpButton(),





        ],

      ),
    ),);
  }
}
