import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/auth/SignIn.dart';
import 'package:epic_expolre/Views/translator/translator.dart';
import 'package:epic_expolre/Views/user_gallary/home.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/bottomNavigationBar.dart';
import 'package:epic_expolre/core/models/user_models/UserInfoAPI.dart';
import 'package:epic_expolre/cubit/user_cubit.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/app_ListTile.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/booking_tabBar.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';
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
                border_color: AppColors.red.withOpacity(.3),
                onTap: () {
                  context.read<UserCubit>().logout();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignInView(),
                    ),
                  );
                  // CacheHelper().removeData(key: )
                  context.read<UserCubit>().signInEmail.clear();
                  context.read<UserCubit>().signInPassword.clear();
                },
              ),
              SizedBox(
                height: 8,
              ),
              AppButton(
                border_color: AppColors.grey,
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
  bool obscurePassword = true;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchData();
    _loadImage();
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

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('profile_image', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppAppBar(
            title: "Profile Settings",
            centerTitle: true,
          ),
          body: isLoading
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(title: "Loading...")
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : AssetImage('assets/images/profilepic.jfif') as ImageProvider,
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
                      SizedBox(height: 22),
                      AppTile(
                        title: "Translator",
                        icon: FontAwesomeIcons.language,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TranslatorView(),
                          ));
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
                      SizedBox(
                        height: 8,
                      ),
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
                        title: "About",
                        icon: Icons.info_outline,
                        onPressed: () {},
                        color: AppColors.blue,
                      ),
                      SizedBox(height: 8),
                      AppTile(
                        title: "Change Password",
                        icon: Icons.lock_outline_rounded,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ));
                        },
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
