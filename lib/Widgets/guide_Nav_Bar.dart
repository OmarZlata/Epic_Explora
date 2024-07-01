
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/tour_guide_views/guide_views/guide_profile/profile.dart';
import 'package:epic_expolre/tour_guide_views/guide_views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GuideNavBar extends StatefulWidget {
  const GuideNavBar({super.key});

  @override
  State<GuideNavBar> createState() => _GuideNavBarState();
}

class _GuideNavBarState extends State<GuideNavBar> {
  final List<Widget> _pages = [
    GuidersReq(),
    GuiderProfileMainScreen(),
  ];
  int  _currentIndex = 0 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: AppColors.violet,
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
            icon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

