import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';
import 'bottomNavigationBar.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppBar({super.key, this.title,this.actions});


  final title ;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: .2,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.gray.withOpacity(.4), width: 1),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.gray,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNavigationBar(),));
            },
          ),
        ),
      ),
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
