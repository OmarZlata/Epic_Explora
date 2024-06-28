import 'dart:math';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/Place_Detials/PlaceDetials.dart';
import 'package:epic_expolre/Views/Place_Detials/PlaceReviews.dart';
import 'package:epic_expolre/core/models/user_models/DetailsplaceAPImode.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_home_card.dart';
import '../../Widgets/app_text.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';


import 'reviews_place_detials.dart';

class detialsPlaceDetials extends StatefulWidget {
  detialsPlaceDetials({super.key, required this.id});

  final int id;

  @override
  State<detialsPlaceDetials> createState() => _detialsPlaceDetialsState();
}

class DetailsPlaceAPI {
  final int cardid;
  final String baseUrl = EndPoint.baseUrl;

  DetailsPlaceAPI(this.cardid);

  Future<DetailsPlaces> getplaceinfo() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    Dio dio = Dio(baseOptions);
    try {
      Response response = await dio.get('${baseUrl}api/user/place/show/$cardid');
      if (response.statusCode == 200) {
        var data = response.data['data']['placeById'];
        print(data);
        return DetailsPlaces.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}

class _detialsPlaceDetialsState extends State<detialsPlaceDetials>
    with SingleTickerProviderStateMixin {
  bool changeColor = false;
  late DetailsPlaceAPI detailsPlaceAPI;
  DetailsPlaces? fetchedData;
  bool isloading = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    detailsPlaceAPI = DetailsPlaceAPI(widget.id);
    fetchData();
  }

  void fetchData() async {
    try {
      DetailsPlaces fetchedData = await detailsPlaceAPI.getplaceinfo();
      setState(() {
        this.fetchedData = fetchedData;
        isloading = false;
      });
    } catch (e) {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    if (fetchedData?.img_url != null && fetchedData!.img_url!.isNotEmpty) {
      imageUrl = fetchedData!.img_url![0];
      // Remove square brackets
      imageUrl = imageUrl!.replaceAll('[', '').replaceAll(']', '');
    }

    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.blue,
              expandedHeight: 356,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: imageUrl != null
                    ? Image.network(
                  imageUrl,
                  height: 356,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : SizedBox(), // Display an empty SizedBox if imageUrl is null
                title: Text(
                  "${fetchedData?.name}",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorPadding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 6,
                bottom: 6,
              ),
              splashBorderRadius: BorderRadius.circular(12),
              indicator: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.black,
              tabs: [
                Tab(
                    child: AppText(
                      title: 'Detials',
                    )),
                Tab(
                    child: AppText(
                      title: 'Reviews  ',
                    )),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PlaceDetailsScreen(Address: '${fetchedData?.address}', Desc: '${fetchedData?.description}', ID: fetchedData?.id??0, Name: fetchedData?.name??"no name"),
                  PlaceReviewsScreen(id: fetchedData?.id??0,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchCustomUr(BuildContext context, previewLink) {}
}
