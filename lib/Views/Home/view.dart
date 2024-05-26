
import 'dart:developer';
import 'package:epic_expolre/Views/States/Aswan/Aswan_tab_bar.dart';
import 'package:epic_expolre/Views/States/RedSea/Red_Sea_tab_bar.dart';
import 'package:epic_expolre/Views/States/cairo/Cairo_tab_bar.dart';
import 'package:epic_expolre/core/api/Recommended.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widgets/app_home_card.dart';
import '../../../Widgets/ranged_slider_app.dart';
import '../../../core/app_colors/app_colors.dart';

import '../../cache/cache_helper.dart';
import '../../core/api/Recommended.dart';
import '../../core/api/Recommended.dart';
import '../../core/api/Recommended.dart';
import '../MainScreens/search_screen.dart';
import '../MainScreens/states_screen.dart';
import '../States/alex/Alex_tab_bar.dart';
import 'cubit.dart';
import 'package:dio/dio.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

List<Recommended>? recommended;
PlaceService placeService = PlaceService();
bool isloading=true;

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
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
      "Authorization":
      "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOption);
    try {
      Response response = await dio.get('${baseUrl}api/user/recommended/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['recommendedData'];

        var x = data.map((e) => Recommended.fromJson(e)).toList();
        isloading=false;

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
                  child: CircularProgressIndicator(),
                );
              }
              final location = cubit.location;
              if (location == null) {
                return Center(child: Text('Something went wrong!'));
              }
              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/profile.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              "Hi,Mohammed Hassan",
                              style: TextStyle(fontSize: 12),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.blue,
                                ),
                                Text(location.district+" ,"+location.country),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          child:
                          Image.asset('assets/images/Notification-icon.png'),
                          onTap: () {},
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
                              onFieldSubmitted: (value) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                ));
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
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
                          "All Offers",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            print('offers');
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/images/offers.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Select State",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StateScreen(),
                            ));
                          },
                          child: Text(
                            "See more",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 120,
                        child: Row(children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlexTabBar(),));
                                },
                                child: Container(
                                    width: 97,
                                    height: 97,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(fit: BoxFit.fill,
                                        image:
                                        AssetImage("assets/images/alex.jpg"),
                                      ),
                                    )),
                              ),
                              Text("Alexandria"),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CairoTabbar(),));},
                                child: Container(
                                    width: 97,
                                    height: 97,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(fit: BoxFit.fill,
                                        image:
                                        AssetImage("assets/images/cairo.jpg"),
                                      ),
                                    )),
                              ),
                              Text("Cairo"),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => RedSeaTabbar(),));},
                                child: Container(
                                    width: 97,
                                    height: 97,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(fit: BoxFit.fill,
                                        image:
                                        AssetImage("assets/images/redsea.jpg"),
                                      ),
                                    )),
                              ),
                              Text("Red Sea"),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AswanTabbar(),));},
                                child: Container(
                                    width: 97,
                                    height: 97,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(fit: BoxFit.fill,
                                        image:
                                        AssetImage("assets/images/Aswan.png"),
                                      ),
                                    )),
                              ),
                              Text("Aswan"),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "Recommendations",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print("Recommendations");
                          },
                          child: Text(
                            "See more",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height:isloading? 50:248,
                      width: isloading? 50:210,
                      child:isloading?Center(child:CircularProgressIndicator(color: AppColors.blue),): ListView.builder(
                          itemCount: recommended!.length,
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.hardEdge,
                          itemBuilder: (context, index) => AppHomeCard(
                            cardText: recommended![index].name!,
                            cardAddress: recommended![index].address!,
                            cardimgUrl: recommended![index].img_url!,
                            cardid: recommended![index].id!,
                          )),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "popular",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print("popular");
                          },
                          child: Text(
                            "See more",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.blue),
                          ),
                        ),
                      ],
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