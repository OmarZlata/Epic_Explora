import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors/app_colors.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/app_text.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitDescription() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: AppText(
                title: 'Description',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.blue,
              )),
          content: AppText(
            title: context.read<UserCubit>().DescriptionController.text,
            fontSize: 16,
            color: AppColors.black,
          ),
          actions: [
            Center(
              child: AppButton(
                title: "Close",
                color: AppColors.blue,
                font_color: AppColors.white,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
      context.read<UserCubit>().SendGuiderReq();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final descriptionText = userCubit.DescriptionController.text;

    return Scaffold(
      appBar: AppAppBar(
        title: 'Enter message',
        color: AppColors.blue,
        iconThemeColor: Colors.white,
        textColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (descriptionText.isNotEmpty)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.blue.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AppText(
                        title: descriptionText,
                      ),
                    ),
                  ),
                ),
              Spacer(),
              Container(
                height: 75.h,
                child: TextFormField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  cursorColor: AppColors.blue,
                  textAlign: TextAlign.start,
                  controller: userCubit.DescriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    return null;
                  },
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 15.h),
              AppButton(
                width: double.infinity,
                color: AppColors.blue,
                font_color: AppColors.white,
                title: "Submit",
                onTap: _submitDescription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
