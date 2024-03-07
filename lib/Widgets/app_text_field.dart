import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    this.cursorHeight = 28,
    this.hintFontSize = 24,
    this.onChanged,
    this.validator,
    this.maxLength,
    required this.radius,
    this.labelText,
    this.icon,
    this.suffixicon,
    required this.obscureText,
    this.maxLines = 1, this.controller,
  }) : super(key: key);

  final String hint;
  final double cursorHeight;
  final double hintFontSize;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final double radius;
  final String? labelText;
  final IconData? icon;
  final Widget? suffixicon;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: AppColors.white,
      cursorHeight: cursorHeight,
      keyboardAppearance: Brightness.dark,
      style: TextStyle(
        color: AppColors.black,
        fontSize: hintFontSize,
      ),
      maxLines: maxLines,
      textInputAction: TextInputAction.newline,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.gray),
        suffixIcon: suffixicon != null && suffixicon is IconData
            ? Icon(suffixicon as IconData?, color: AppColors.gray)
            : suffixicon,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.black),
        counterStyle: TextStyle(
          color: AppColors.white,
        ),
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
          borderRadius: BorderRadius.circular(radius),
        ),
        hintStyle: TextStyle(
          color: AppColors.gray,
          fontSize: hintFontSize,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
