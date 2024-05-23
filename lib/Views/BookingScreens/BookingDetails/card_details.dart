import 'package:epic_expolre/Views/BookingScreens/BookingDetails/booking_confirmation.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/app_text_field.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(
          centerTitle: true,
          title: "Card details",
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: [
            AppText(
                title: "Select Method",
                fontWeight: FontWeight.bold,
                fontSize: 16),
            SizedBox(
              height: 12.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 55.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.creditCard,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Form(
              key: context.read<UserCubit>().paymentFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      title: "Name on Card",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    hint: "Card Name",
                    radius: 8,
                    obscureText: false,
                    hintFontSize: 14,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            title: "Card Number",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppTextField(
                          textInputType: TextInputType.number,
                          hint: "Card Number",
                          radius: 8,
                          obscureText: false,
                          hintFontSize: 14,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Card';
                            }
                            if (value.length != 15 && value.length != 16) {
                              return 'Invalid Card';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Invalid Card';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                title: "Expire Date",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            SizedBox(
                              height: 16.h,
                            ),
                            AppTextField(
                              textInputType: TextInputType.number,
                              hint: "xx/xx",
                              radius: 8,
                              obscureText: false,
                              hintFontSize: 14,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Expire Date';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                title: "CVV",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            SizedBox(
                              height: 16.h,
                            ),
                            AppTextField(
                              textInputType: TextInputType.number,
                              hint: "xxx",
                              radius: 8,
                              obscureText: false,
                              hintFontSize: 14,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your CVV';
                                }
                                if (value.length != 3) {
                                  return 'Invalid CVV';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Invalid CVV';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  AppButton(
                    title: "Pay",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      if (context
                          .read<UserCubit>()
                          .paymentFormKey
                          .currentState!
                          .validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookingConfirmation(),
                        ));
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
