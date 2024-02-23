import 'package:flutter/material.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

import '../Widgets/app_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.Blue),
      body: Column(
        children: [
          AppButton(title: 'Enter',),
        ],
      ),
    );
  }
}
