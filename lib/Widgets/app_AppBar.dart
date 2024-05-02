import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';
import 'bottomNavigationBar.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppBar({super.key,this.centerTitle, this.title,this.actions});


  final title ;
  final List<Widget>? actions;
  final bool ?centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: AppColors.blue
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;

}
