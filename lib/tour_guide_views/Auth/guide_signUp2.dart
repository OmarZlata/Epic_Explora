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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GuideSignUp2 extends StatefulWidget {
  const GuideSignUp2({super.key});

  @override
  State<GuideSignUp2> createState() => _GuideSignUp2State();
}

class _GuideSignUp2State extends State<GuideSignUp2> {
  bool obscurePassword = true;
  bool obscurePasswordConfirm = true;
  bool isChecked = false;
  File? image;
  final ImagePicker imagePicker = ImagePicker();

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
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
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
                builder: (context) => SignInView(),
              ),
            );
          } else if (state is SignUpFailure) {
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
            appBar: const AppAppBar(
              title: 'Tour Guide SignUp',
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Form(
                // key: signUpFormKey,
                child: Column(
                  children: [
                    Image.asset('assets/images/Welcome1.png'),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  icon: Icons.lock_outline,
                                  hintFontSize: 12,
                                  obscureText: obscurePassword,
                                  maxLines: 1,
                                  controller:
                                      context.read<UserCubit>().GuiderPhoneNumber,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your Phone Number';
                                    }
                                    if (value.length != 11 &&
                                        value.length != 10) {
                                      return 'Invalid Phone Number';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  icon: Icons.lock_outline,
                                  hintFontSize: 12,
                                  obscureText: obscurePasswordConfirm,
                                  maxLines: 1,
                                  controller:
                                      context.read<UserCubit>().GuiderNationalId,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Upload National ID Image",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        image == null
                            ? InkWell(
                                onTap: uploadImage,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.plus,
                                        color: AppColors.grey.withOpacity(.9),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      AppText(
                                        title: "Upload Image",
                                        color: AppColors.grey.withOpacity(.9),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                          width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(image!,fit: BoxFit.cover,))),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: AppColors.violet,
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TermsScreen(),
                            ));
                          },
                          child: AppText(
                            title: "Terms & Conditions",
                            color: AppColors.blue,
                          ),
                        )
                      ],
                    ),
                    state is SignUpLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.blue,
                            ),
                          )
                        : AppButton(
                            border_color: AppColors.white,
                            font_color: AppColors.white,
                            color: isChecked
                                ? AppColors.violet
                                : AppColors.grey.withOpacity(.3),
                            title: "SignUp",
                            onTap: isChecked
                                ? () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => GuideSignIn(),
                                    ));
                                    // if (signUpFormKey.currentState!.validate()) {
                                    //   context.read<UserCubit>().signUp();
                                    // }
                                  }
                                : null,
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
