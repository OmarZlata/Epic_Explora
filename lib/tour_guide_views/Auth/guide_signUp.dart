import 'dart:io';

import 'package:epic_expolre/Views/Profile/Terms.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/app_text_field.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:epic_expolre/tour_guide_views/Auth/guide_signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../Views/Maps/splash/onboarding_3.dart';

class GuideSignUp extends StatefulWidget {
  const GuideSignUp({super.key});

  @override
  State<GuideSignUp> createState() => _GuideSignUpState();
}

class _GuideSignUpState extends State<GuideSignUp> {
  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isChecked = false;
  File? image;
  final ImagePicker imagePicker = ImagePicker();
  final GlobalKey<FormState> guiderSignUpFormKey = GlobalKey<FormState>();
  final List<String> locations = ['Cairo', 'Alexandria' ,'Aswan', 'Red Sea','Luxor' ];
  double _currentSliderValue = 0;


  Future<void> uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GuiderSignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.blue,
              content: Center(
                child: AppText(
                  title: 'Registration Done',
                ),
              ),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GuiderSignIn(),
            ),
          );
        } else if (state is GuiderSignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.blue,
              content: Center(
                child: AppText(
                  title: 'Failed to Sign Up',
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppAppBar(
            title: "Sign Up",
            centerTitle: true,
            leading: IconButton(
              icon: Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoogleMapSplashView(),
                    ));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Form(
                key: guiderSignUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset('assets/images/Welcome2.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Full Name",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          hint: "Name",
                          radius: 8,
                          icon: Icons.person,
                          hintFontSize: 12,
                          obscureText: false,
                          maxLines: 1,
                          controller: context.read<UserCubit>().GuiderSignUpName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppText(
                          title: "Email",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          hint: "Email",
                          radius: 8,
                          icon: Icons.email_outlined,
                          hintFontSize: 12,
                          obscureText: false,
                          maxLines: 1,
                          controller: context.read<UserCubit>().GuiderSignUpEmail,
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
                              color: obscurePassword
                                  ? AppColors.grey
                                  : AppColors.blue,
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
                          controller: context.read<UserCubit>().GuiderSignUpPassword,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppText(
                          title: "Confirm Password",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
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
                              color: obscurePasswordConfirm
                                  ? AppColors.grey
                                  : AppColors.blue,
                              obscurePasswordConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          obscureText: obscurePasswordConfirm,
                          maxLines: 1,
                          controller: context.read<UserCubit>().GuiderConfirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != context.read<UserCubit>().GuiderSignUpPassword.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppText(
                          title: "Phone Number",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          hint: "Phone Number",
                          radius: 8,
                          icon: Icons.phone,
                          hintFontSize: 12,
                          obscureText: false,
                          textInputType: TextInputType.phone,
                          maxLines: 1,
                          controller: context.read<UserCubit>().GuiderPhoneNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            if (value.length != 11 && value.length != 10) {
                              return 'Invalid Phone Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppText(
                          title: "National ID",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          hint: "National ID",
                          radius: 8,
                          icon: Icons.credit_card,
                          hintFontSize: 12,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          maxLines: 1,
                          controller: context.read<UserCubit>().GuiderNationalId,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your National ID';
                            }
                            if (value.length != 14) {
                              return 'Invalid National ID';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppText(
                          title: "Your State",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: context.read<UserCubit>().StateGuiderDescriptionController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Selected Location',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Slider(
                              value: _currentSliderValue,
                              min: 0,
                              max: (locations.length - 1).toDouble(),
                              divisions: locations.length - 1,
                              label: locations[_currentSliderValue.toInt()],
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                  context.read<UserCubit>().StateGuiderDescriptionController.text = locations[_currentSliderValue.toInt()];
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                            ),
                            AppText(
                              title: "Accept Terms and Conditions",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TermsScreen(),
                                  ),
                                );
                              },
                              child: AppText(
                                title: "View",
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        state is GuiderSignUpLoading
                            ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        )
                            : AppButton(
                          width: double.infinity,
                          border_color: AppColors.white,
                          font_color: AppColors.white,
                          color: isChecked
                              ? AppColors.violet
                              : AppColors.grey.withOpacity(.3),
                          title: "SignUp",
                          onTap: isChecked
                              ? () {
                            if (guiderSignUpFormKey.currentState!.validate()) {
                              guiderSignUpFormKey.currentState!.save();
                              context.read<UserCubit>().GuiderSignUp();
                            }
                          }
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
