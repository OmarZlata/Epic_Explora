import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/Widgets/app_text.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscurePassword = true;
  bool obscurePassword2 = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmpasswordController = TextEditingController();

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(height: 110,
            child: Column(
              children: [Image.asset('assets/images/icon.png'),
                AppText(
                  title: "Reset Password successfully",
                  color: AppColors.Green,
                  fontWeight: FontWeight.bold,
                ),

              ],
            ),

          ),
          actions: <Widget>[
        Divider(color: AppColors.gray,height: 0.5),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(child: AppText(title: "Ok",color: AppColors.Black,fontWeight: FontWeight.bold,)),
            ),
          ],
        );
      },
    );
  }

  Widget Image_() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        'assets/images/reset.png',
      ),
    );
  }

  Widget PasswordTextField() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "New Password",
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
      padding:
          const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Confirm New Password",
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
                  obscurePassword2 = !obscurePassword2;
                });
              },
              icon: Icon(
                obscurePassword2 ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: obscurePassword2,
            maxLines: 1,
            controller: ConfirmpasswordController,
          ),
        ],
      ),
    );
  }

  Widget ContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppButton(
        title: "Confirm",
        color: AppColors.Blue,
        font_color: AppColors.white,
        onTap: () {
          _showAlertDialog(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            title: "Reset Password",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image_(),
              PasswordTextField(),
              ConfirmPasswordTextField(),
              SizedBox(
                height: 50,
              ),
              ContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}
