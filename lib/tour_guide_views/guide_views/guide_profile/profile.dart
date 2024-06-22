import 'package:epic_expolre/Views/Profile/AppMode.dart';
import 'package:epic_expolre/Views/Profile/Currency_Convertor.dart';
import 'package:epic_expolre/Views/Profile/Edit_Profile.dart';
import 'package:epic_expolre/Views/Profile/Terms.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_ListTile.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/Widgets/booking_tabBar.dart';
import 'package:epic_expolre/Widgets/guide_Nav_Bar.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuideProfile extends StatelessWidget {
  const GuideProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: "Profile Settings",
          iconThemeColor: AppColors.black,
        ),
        body :ListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/images/profilepic.jfif',
                  ),
                ),
                SizedBox(height: 8),
                AppText(
                  title:  'No Name',
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  title: 'No Email',
                  color: AppColors.grey,
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 29,
                    width: 115,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: "Edit Profile",
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.mode_edit_outline_outlined,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.violet,

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            AppTile(
              title: "Setting",
              icon: Icons.settings_outlined,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppModeScreen(),
                  ),
                );
              },
              color: AppColors.violet.withOpacity(.5),
            ),
            SizedBox(height: 8),
            AppTile(
              title: "History",
              icon: Icons.history,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookingTabBar(),
                  ),
                );
              },
              color: AppColors.violet.withOpacity(.5),
            ),
            SizedBox(height: 8),
            AppTile(
              title: "Terms of service",
              icon: Icons.library_books,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TermsScreen(),
                  ),
                );
              },
              color: AppColors.violet.withOpacity(.5),
            ),
            SizedBox(height: 8),
            AppTile(
              title: "About",
              icon: Icons.info_outline,
              onPressed: () {},
              color: AppColors.violet.withOpacity(.5),
            ),
            SizedBox(height: 8),
            AppTile(
              title: "Change Password",
              icon: Icons.lock_outline_rounded,
              onPressed: () {},
              color: AppColors.violet.withOpacity(.5),
            ),
            SizedBox(height: 8),
            AppTile(
              title: "Logout",
              icon: Icons.logout,
              onPressed: () {
              },
              color: Colors.red,
            ),
          ],
        ),
      )
    );
  }
}
