import 'dart:developer';
import 'package:epic_expolre/Views/Home/360/screens/home_screen.dart';
import 'package:epic_expolre/Views/Home/Catogeries/states.dart';
import 'package:epic_expolre/Views/States/Aswan/Aswan_tab_bar.dart';
import 'package:epic_expolre/Views/States/RedSea/Red_Sea_tab_bar.dart';
import 'package:epic_expolre/Views/States/cairo/Cairo_tab_bar.dart';
import 'package:epic_expolre/Views/States/luxor/luxor_tab_bar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/api/Recommended.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/models/user_models/UserInfoAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/app_home_card.dart';
import '../../../Widgets/filter.dart';
import '../../../core/app_colors/app_colors.dart';

import '../../cache/cache_helper.dart';
import '../../core/api/Recommended.dart';
import '../../core/api/Recommended.dart';
import '../../core/api/Recommended.dart';

import '../../generated/l10n.dart';
import '../search/search_screen.dart';
import '../MainScreens/states_screen.dart';
import '../States/alex/Alex_tab_bar.dart';
import 'cubit.dart';
import 'package:dio/dio.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class UserInfoAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<UserInfo> getUserInfo() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    Dio dio = Dio(baseOptions);
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

List<Recommended>? recommended;
UserInfoAPI? userInfoAPI;
UserInfo? userInfo;
PlaceService placeService = PlaceService();
bool isloading = true;
bool isloading2 = true;

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColors.white.withOpacity(.001),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: SliderScreen(),
        ),
      );
    },
  );
}

class PlaceService {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<Recommended>> getAllPlaces() async {
    final BaseOptions baseOption = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOption);
    try {
      Response response = await dio.get('${baseUrl}api/user/recommended/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['recommendedData'];

        var x = data.map((e) => Recommended.fromJson(e)).toList();
        isloading = false;

        return x;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    fetchData();

    _fetchPlaces();
  }

  void printdata() async {
    final BaseOptions baseOption = BaseOptions(headers: {
      "Authorization":
          "Bearer 38|WGCBg2vlkOAru2RUAVzMn7MhGIEx8GaoTAGXGzY8553dcf19",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio dio = Dio(baseOption);
    final String baseUrl = 'https://c0bd-156-197-50-97.ngrok-free.app';
    Response response = await dio.get('$baseUrl/api/user/recommended/');
  }

  void fetchData() async {
    try {
      UserInfo fetchedData = await UserInfoAPI().getUserInfo();
      setState(() {
        userInfo = fetchedData;
        isloading2 = false;
      });
    } catch (e) {
      setState(() {
        isloading2 = false;
      });
    }
  }

  void _fetchPlaces() async {
    try {
      List<Recommended> fetchedPlaces = await placeService.getAllPlaces();
      setState(() {
        recommended = fetchedPlaces;
        log("m    $fetchedPlaces");
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getCurrentLocation(),
        child: Scaffold(
          body: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              final cubit = BlocProvider.of<HomeCubit>(context);
              if (state is HomeLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.blue),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(title: S.of(context).loading,)
                    ],
                  ),
                );
              }
              final location = cubit.location;
              if (location == null) {
                return Center(child: Text(S.of(context).error,));
              }
              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  title: userInfo?.name?.toUpperCase() ??
                                      S.of(context).noName,
                                  color: AppColors.blue,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: AppColors.blue),
                                if (location != null)
                                  Text(
                                      '${location.district}, ${location.country}'),
                                if (location == null)
                                  Text(S.of(context).locationUnavailable),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                              Image.asset(height: 45, 'assets/images/logo.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: 285,
                            height: 60,
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SearchScreen(states: "", title: ""),
                                ));
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: S.of(context).search,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .blue)
                                  ),
                                  prefixIcon:
                                      Icon(Icons.search, color: AppColors.blue),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              child: Image.asset('assets/images/filters-2.png'),
                              onTap: () {
                                _showBottomSheet(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "360 Images",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeImageScreen(),));
                          },
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/360DD.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          S.of(context).selectState,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    States(),

                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          S.of(context).recommendations,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      constraints: isloading
                          ? null
                          : BoxConstraints(
                              maxHeight: 248,
                              maxWidth: 210,
                            ),
                      child: isloading
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
                                  AppText(title: S.of(context).loading,)
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: recommended?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.hardEdge,
                              itemBuilder: (context, index) => AppHomeCard(
                                cardText: recommended![index].name!,
                                cardAddress: recommended![index].address!,
                                cardimgUrl: recommended![index].img_url!,
                                cardid: recommended![index].id!,
                              ),
                            ),
                    ),

                    SizedBox(height: 16),
                    // Container(
                    //   height: 248,
                    //   width: 210,
                    //   child: ListView.builder(
                    //     itemCount: 9,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) => AppHomeCard(cardText: allplaces![index].name! ,cardAddress: allplaces![index].address!,),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
