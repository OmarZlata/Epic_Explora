import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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

  Widget PasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20,bottom: 20),
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

  Widget SaveButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        color: AppColors.blue,
        font_color: AppColors.white,

        title: 'Save',

        onTap: () {
          final email = emailController.text;
          final password = passwordController.text;
          // Perform sign-in logic with email and password
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24,),
              Stack(
                children: [
                      CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/profilepic.jfif',
                      )),
                  Positioned(
                      right: 2,
                      bottom: 2,
                      child: InkWell(
                        onTap: () {

                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor:
                          AppColors.blue,
                          child: Icon(Icons.mode_edit_outline_outlined,color: AppColors.white,
                            size: 16,),

                        ),
                      ))
                    ],
              ),
              NameTextField(),
              EmailTextField(),
              PasswordTextField(),
              SizedBox(height: 80,),
              SaveButton()


            ],
          ),
        ),
      ),
    );
  }
}
