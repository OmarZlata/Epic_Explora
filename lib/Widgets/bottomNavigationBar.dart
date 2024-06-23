import 'package:epic_expolre/Views/MainScreens/Favourite_Hotels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Views/Home/view.dart';
import '../Views/MainScreens/favorites_screen.dart';

import '../Views/Profile/profile_main.dart';
import '../core/app_colors/app_colors.dart';
import 'trips_tabBar.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  final List<Widget> _pages = [
    HomeView(),
    FavouriteHotelsScreen(),
    OurGuiders(),
    ProfileMainScreen(),
  ];
  int  _currentIndex = 0 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: AppColors.blue,
        unselectedItemColor:AppColors.grey ,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Tour Guider',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

