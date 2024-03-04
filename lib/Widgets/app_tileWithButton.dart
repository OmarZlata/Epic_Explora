import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

class AppTileWithButton extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isSelected;
  final Function(bool) onSelect;

  const AppTileWithButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _AppTileWithButtonState createState() => _AppTileWithButtonState();
}

class _AppTileWithButtonState extends State<AppTileWithButton> {
  Color _borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.isSelected) {
            _borderColor = Colors.blue;
          } else {
            _borderColor = Colors.grey;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.isSelected ? AppColors.Blue : AppColors.gray,
          ),
        ),
        child: ListTile(
          leading: Icon(widget.iconData,color: widget.isSelected ? AppColors.Blue : AppColors.gray),
          title: Text(
            widget.title,

          ),
          trailing: Radio<bool>(
            value: true,
            groupValue: widget.isSelected,
            activeColor: AppColors.Blue,
            onChanged: (value) {
              widget.onSelect(value ?? false);
            },
          ),
        ),
      ),
    );
  }
}