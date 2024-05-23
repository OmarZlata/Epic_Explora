import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/app_ListTile.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/booking_tabBar.dart';
import '../../core/app_colors/app_colors.dart';
import '../Home/view.dart';
import 'AppMode.dart';
import 'Edit_Profile.dart';
import 'Terms.dart';
import 'Currency_Convertor.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeView())),
              ),
              backgroundColor: AppColors.white,
              elevation: 1,
              title: Text(
                "Profile Settings",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Column(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/profilepic.jfif',
                      )),
                  AppText(
                    title: 'Mohammed Ali',
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    title: "Mohammed@gmail.com",
                    color: AppColors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ));
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
                  )
                ],
              ),
              AppTile(
                title: "Setting",
                icon: Icons.settings_outlined,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppModeScreen(),
                  ));
                },
                color: AppColors.blue,
              ),
              AppTile(
                title: "Currency Converter",
                icon: CupertinoIcons.money_dollar_circle,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Currency(),
                  ));
                },
                color: AppColors.blue,
              ),
              AppTile(
                title: "My Bookings",
                icon: Icons.settings_outlined,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookingTabBar(),
                  ));
                },
                color: AppColors.blue,
              ),
              AppTile(
                title: "Terms of service",
                icon: Icons.library_books,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsScreen(),
                  ));
                },
                color: AppColors.blue,
              ),
              AppTile(
                title: "Privacy policy",
                icon: Icons.privacy_tip_outlined,
                onPressed: () {},
                color: AppColors.blue,
              ),
              AppTile(
                title: "About",
                icon: Icons.info_outline,
                onPressed: () {},
                color: AppColors.blue,
              ),
              AppTile(
                title: "Change Password",
                icon: Icons.lock_outline_rounded,
                onPressed: () {},
                color: AppColors.blue,
              ),
              AppTile(
                title: "Logout",
                icon: Icons.logout,
                onPressed: () {
                  context.read<UserCubit>().logout();
                  state is LogoutLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        )
                      : print("Token Removed");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInView(),));
                },
                color: Colors.red,
              ),
            ],
          ),
        ));
      },
    );
  }
}


