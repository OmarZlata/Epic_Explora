import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/app_ListTile.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/booking_tabBar.dart';
import '../../core/app_colors/app_colors.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  Widget Settings() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "Setting",
        icon: Icons.settings_outlined,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget Currency() {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: AppTile(
        title: "Currency Converter",
        icon: CupertinoIcons.money_dollar_circle,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget Bookings(context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "My Bookings",
        icon: Icons.settings_outlined,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingTabBar(),));
        },
        color: AppColors.blue,
      ),
    );
  }

  Widget Terms() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "Terms of service",
        icon: Icons.library_books,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget Privacy() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "Privacy policy",
        icon: Icons.privacy_tip_outlined,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget About() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "About",
        icon: Icons.info_outline,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget password() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "Change Password",
        icon: Icons.lock_outline_rounded,
        onPressed: () {},
        color: AppColors.blue,
      ),
    );
  }

  Widget Logout() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: AppTile(
        title: "Logout",
        icon: Icons.logout,
        onPressed: () {},
        color: Colors.red,
      ),
    );
  }

  Widget ProfilePic() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/profilepic.jfif',
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              title: 'Mohammed Ali',
              fontWeight: FontWeight.bold,
            ),
          ),
          AppText(
            title: "Mohammed@gmail.com",
            color: AppColors.gray,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {},
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
                      fontWeight: FontWeight.w500,
                    ),
                    Icon(
                      Icons.mode_edit_outline_outlined,
                      color: AppColors.white,
                      size: 18,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.blue,
                  border: Border.all(
                    color: AppColors.blue,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
      children: [
          ProfilePic(),
          Settings(),
          Currency(),
          Bookings(context),
          Terms(),
          Privacy(),
          About(),
          password(),
          Logout()
      ],
    ),
        ));
  }
}
