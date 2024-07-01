import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:panorama_viewer/panorama_viewer.dart';

class ImageScreen extends StatelessWidget {
  final Image image;
  const ImageScreen(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,color: AppColors.white,
          )
        ),
        centerTitle: true,
        backgroundColor: AppColors.blue,
        title: AppText(
          title: "360 Degree Photos",
          color: AppColors.white,
          fontSize: 18,

        ),
      ),
      body: PanoramaViewer(
        child: image,
      ),
    );
  }
}
