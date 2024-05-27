import 'package:epic_expolre/Widgets/app_text.dart';
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
      centerTitle: centerTitle??true,
      title: AppText(title: "$title",color: AppColors.black,fontWeight: FontWeight.w600,fontSize: 18),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;

}
