import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';
import 'app_text.dart';

class AppTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  const AppTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey
        )

      ),
      child: ListTile(
        title: AppText(
          title: title,
          color: AppColors.black,
          fontSize: 16,

        ),
        leading: Icon(icon,color: color),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onPressed,


      ),
    );
  }
}
