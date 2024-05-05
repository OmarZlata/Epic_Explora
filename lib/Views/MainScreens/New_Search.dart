import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/API_App_card.dart';


class NewSearchScreen extends StatefulWidget {
  const NewSearchScreen({Key? key});

  @override
  State<NewSearchScreen> createState() => _NewSearchScreenState();
}

class _NewSearchScreenState extends State<NewSearchScreen> {
  bool isloading = true;
  int currentPage = 1;
  List<dynamic> imgUrls = [
    "https://example.com/image1.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      isloading = true;
    });
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imgUrls.length,
        itemBuilder: (context, index) => APIAppCard(
          cardText: "card Text",
          cardAddress: "card Address",
          cardimgUrl: imgUrls[index],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.blue)),
              onPressed: goToPreviousPage,
              child: Text('Previous Page'),
            ),
            Text('Page $currentPage'),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.blue)),
              onPressed: goToNextPage,
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}