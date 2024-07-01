import 'package:epic_expolre/Views/Home/360/components/thumbnail.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import 'package:flutter/material.dart';

class HomeImageScreen extends StatelessWidget {
  const HomeImageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Thumbnail> thumbList = [
      const Thumbnail(
        imagePath: 'assets/images/balcony_water.jpg',
        thumbPath: 'assets/images/balcony_water.jpg',
      ),
      const Thumbnail(
          imagePath: 'assets/images/boat.jpg',
          thumbPath: 'assets/images/boat.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/carlsbad_nps.jpg',
          thumbPath: 'assets/images/carlsbad_nps.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/carlsbad.jpg',
          thumbPath: 'assets/images/carlsbad.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/dock.jpg',
          thumbPath: 'assets/images/dock.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/game_world.jpeg',
          thumbPath: 'assets/images/game_world.jpeg'),
      const Thumbnail(
          imagePath: 'assets/images/lagoon.jpg',
          thumbPath: 'assets/images/lagoon.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/mountain.jpg',
          thumbPath: 'assets/images/mountain.jpg'),
      const Thumbnail(
          imagePath: 'assets/images/planet.jpeg',
          thumbPath: 'assets/images/planet.jpeg'),
      const Thumbnail(
          imagePath: 'assets/images/room.jpeg',
          thumbPath: 'assets/images/room.jpeg'),
      const Thumbnail(
          imagePath: 'assets/images/bunker.jpeg',
          thumbPath: 'assets/images/bunker.jpeg'),
      const Thumbnail(
          imagePath: 'assets/images/grocery.jpeg',
          thumbPath: 'assets/images/grocery.jpeg'),
    ];
    return Scaffold(
      appBar: AppAppBar(
        title: "360 degree Photo",
        color: AppColors.blue,
        textColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: kIsWeb
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.5),
                  children: thumbList,
                ),
              )
            : ListView(
                children: thumbList,
              ),
      ),
    );
  }
}
