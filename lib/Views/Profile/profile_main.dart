import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Views/user_gallary/home.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/bottomNavigationBar.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/app_ListTile.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/booking_tabBar.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/models/UserInfoAPI.dart'; // Assuming UserInfo is defined here
import '../Home/view.dart';
import 'AppMode.dart';
import 'Edit_Profile.dart';
import 'Terms.dart';
import 'Currency_Convertor.dart';

class UserInfoAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<UserInfo> getUserInfo() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);
    try {
      Response response = await dio.get('${baseUrl}api/user/show_profile');
      if (response.statusCode == 200) {
        var data = response.data;
        return UserInfo.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: AppText(
          title: 'Logout',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.red.withOpacity(.5),
        )),
        content: Container(
          height: 140,
          child: Column(
            children: [
              Container(
                  child:
                      Flexible(child: Image.asset('assets/images/logout.png'))),
              SizedBox(
                height: 8,
              ),
              AppText(
                title: "Are You Sure You Want",
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              AppText(
                title: "To Logout ?",
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Divider(color: AppColors.grey, height: 0.5),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              AppButton(
                title: "Logout !",
                color: AppColors.red.withOpacity(.4),
                font_color: AppColors.white,
                onTap: () {
                  context.read<UserCubit>().logout();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignInView(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              AppButton(
                title: "Cancel",
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );
    },
  );
}

class ProfileMainScreen extends StatefulWidget {
  ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  bool isLoading = true;
  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      UserInfo fetchedData = await UserInfoAPI().getUserInfo();
      setState(() {
        userInfo = fetchedData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => bottomNavigationBar(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.black,
              ),
            ),
            backgroundColor: AppColors.white,
            elevation: 1,
            title: Text(
              "Profile Settings",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.blue,
                ))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                  child: ListView(
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
                            title: userInfo?.name ?? 'No Name',
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            title: userInfo?.email ?? 'No Email',
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
                                    fontWeight: FontWeight.w500,
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
                                color: AppColors.blue,
                                border: Border.all(
                                  color: AppColors.blue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
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
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "Currency Converter",
                        icon: CupertinoIcons.money_dollar_circle,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Currency(),
                            ),
                          );
                        },
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8,),
                      AppTile(
                        title: "Your Memories",
                        icon: CupertinoIcons.photo_fill_on_rectangle_fill,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserGallery(),
                            ),
                          );
                        },
                        color: AppColors.blue,
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
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "Privacy policy",
                        icon: Icons.privacy_tip_outlined,
                        onPressed: () {},
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "About",
                        icon: Icons.info_outline,
                        onPressed: () {},
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "Change Password",
                        icon: Icons.lock_outline_rounded,
                        onPressed: () {},
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "Logout",
                        icon: Icons.logout,
                        onPressed: () {
                          if (state is LogoutLoading) {
                            Center(
                              child: CircularProgressIndicator(
                                color: AppColors.blue,
                              ),
                            );
                          } else {
                            _showAlertDialog(context);

                          }
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
