import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';
import 'bottomNavigationBar.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppBar({super.key,this.centerTitle, this.title,this.actions, this.color, this.iconThemeColor, this.textColor, this.leading});


  final title ;
  final List<Widget>? actions;
  final bool ?centerTitle;
  final Color ?color;
  final Color ? iconThemeColor;
  final Color ? textColor;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      iconTheme: IconThemeData(
          color: iconThemeColor ?? AppColors.blue
      ),
      backgroundColor: color ??AppColors.white ,
      elevation: 0,
      centerTitle: centerTitle??true,
      title: AppText(title: "$title",color: textColor,fontWeight: FontWeight.w600,fontSize: 18),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;

}
