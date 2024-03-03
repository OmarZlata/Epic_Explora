import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/app_text.dart';
import 'package:graduation_project/core/app_colors/app_colors.dart';

class map extends StatelessWidget {
  const map({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 6),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            ),
          ),
        ),
        title: const AppText(
            title: "  Map",
            color: AppColors.Black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
            const Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/sanaa map .png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ]),
      )
    );
  }
}
