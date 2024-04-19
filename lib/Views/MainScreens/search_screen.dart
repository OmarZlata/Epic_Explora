import 'package:flutter/material.dart';
import '../../Widgets/app_card.dart';
import '../../core/app_colors/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey, width: 1),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.grey,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          "    Search Result",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => AppCard(
        ),
        itemCount: 5,
      ),
    );
  }
}
