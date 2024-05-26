import 'package:dio/dio.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final String baseUrl = EndPoint.baseUrl;

  Future<void> updateProfile(String name, String email, String password, String confirmPassword) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio _dio = Dio(baseOptions);

    try {
      final response = await _dio.post(
        '${baseUrl}api/user/edit_profile',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Profile updated successfully: ${response.data}');
        _showSuccessDialog();
      } else {
        _showFailedDialog();
        // Handle non-200 status codes
        print('Failed to update profile: ${response.statusCode}');
        print('Response: ${response.data}');
      }
    } catch (e) {
      // Handle errors

      print('Error updating profile: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your profile has been updated successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _showFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Failed'),
          content: Text('Failed to Update your profile.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
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
            controller: nameController,
          ),
        ],
      ),
    );
  }

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

  Widget PasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 20),
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

  Widget ConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 20),
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
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: obscureConfirmPassword,
            maxLines: 1,
            controller: confirmPasswordController,
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
          final name = nameController.text;
          final email = emailController.text;
          final password = passwordController.text;
          final confirmPassword = confirmPasswordController.text;

          updateProfile(name, email, password, confirmPassword);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Edit Profile',centerTitle: true),
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
                          backgroundColor: AppColors.blue,
                          child: Icon(Icons.mode_edit_outline_outlined, color: AppColors.white,
                            size: 16,),

                        ),
                      ))
                ],
              ),
              NameTextField(),
              EmailTextField(),
              PasswordTextField(),
              ConfirmPasswordTextField(),
              SizedBox(height: 20,),
              SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
