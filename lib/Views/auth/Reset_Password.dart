import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/app_text_field.dart';
import '../../core/app_colors/app_colors.dart';

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
          content: Container(
            height: 110,
            child: Column(
              children: [
                Image.asset('assets/images/icon.png'),
                AppText(
                  title: "Reset Password successfully",
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Divider(color: AppColors.grey, height: 0.5),
            TextButton(
              onPressed: () {
               Navigator.of(context).pop();
              },
              child: Center(
                  child: AppText(
                title: "Ok",
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(
          title: 'Reset Password',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Image.asset(
                'assets/images/reset.png',
              ),
              Form(
                // key: context.read<UserCubit>().resstPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "New Password",
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
                      controller: context.read<UserCubit>().newPassword,
                      suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          color:
                              obscurePassword ? AppColors.grey : AppColors.blue,
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: obscurePassword,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppText(
                      title: "Confirm New Password",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      hint: "Confirm New Password",
                      radius: 8,
                      icon: Icons.lock_outline,
                      hintFontSize: 12,
                      controller: context.read<UserCubit>().confirmNewPassword,
                      suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword2 = !obscurePassword2;
                          });
                        },
                        icon: Icon(
                          color:
                              obscurePassword2 ? AppColors.grey : AppColors.blue,
                          obscurePassword2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: obscurePassword2,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          title: "Confirm",
                          color: AppColors.blue,
                          font_color: AppColors.white,
                          onTap: () {
                            context.read<UserCubit>().resetPassword();
                            _showAlertDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
