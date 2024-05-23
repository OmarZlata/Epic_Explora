import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {


  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.font_color,
    this.color,
    this.border_color,
    this.height,
    this.width
  });

  final String title;
  final font_color;
  final color;
  final border_color;
  final double? height;
  final double? width;


  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: height ??48,
        width: width ??344,
        alignment: Alignment.center,
        child: AppText(
          title: title,
          color: font_color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color??AppColors.grey.withOpacity(.2),
          border: Border.all(
            color: border_color ??AppColors.white,
            width: 1,
          ),

        ),
      ),
    );
  }
}
