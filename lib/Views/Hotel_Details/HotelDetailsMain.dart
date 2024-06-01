import 'dart:math';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/Hotel_Details/HotelDetails.dart';
import 'package:epic_expolre/Views/Place_Detials/PlaceReviews.dart';
import 'package:epic_expolre/core/models/DetailsHotelsAPI.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_home_card.dart';
import '../../Widgets/app_text.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/models/DetailsplaceAPImode.dart';
import 'HotelsReviews.dart';

class HotelsDetails extends StatefulWidget {
  HotelsDetails({super.key, required this.id});

  final int id;

  @override
  State<HotelsDetails> createState() => _HotelsDetailsState();
}

class DetailsHotelsApi {
  final int cardid;
  final String baseUrl = EndPoint.baseUrl;

  DetailsHotelsApi(this.cardid);

  Future<DetailsHotels> getplaceinfo() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    Dio dio = Dio(baseOptions);
    try {
      Response response =
          await dio.get('$baseUrl/api/user/hotel/get-hotel/$cardid');
      if (response.statusCode == 200) {
        var data = response.data['data'];
        print('API Response Data: $data'); // Debug print

        // Ensure you are accessing the first item in the list if that's the expected structure
        var hotelData = data[0];
        return DetailsHotels.fromJson(hotelData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}

class _HotelsDetailsState extends State<HotelsDetails>
    with SingleTickerProviderStateMixin {
  bool changeColor = false;
  late DetailsHotelsApi detailsHotelsApi;
  DetailsHotels? fetchedData;
  bool isloading = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    detailsHotelsApi = DetailsHotelsApi(widget.id);
    fetchData();
  }

  void fetchData() async {
    try {
      DetailsHotels fetchedData = await detailsHotelsApi.getplaceinfo();
      setState(() {
        this.fetchedData = fetchedData;
        isloading = false;
      });
      print('Fetched Data: ${this.fetchedData}'); // Debug print
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error fetching data: $e'); // Debug print
    }
  }

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    if (fetchedData?.img_url != null && fetchedData!.img_url!.isNotEmpty) {
      imageUrl = fetchedData!.img_url![0];
    }

    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                          : SizedBox(),
                      // Display an empty SizedBox if imageUrl is null
                      title: Text(
                        fetchedData?.name ?? 'Loading...',
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
                        title: 'Details',
                      )),
                      Tab(
                          child: AppText(
                        title: 'Reviews',
                      )),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        HotelDetailsScreen(
                          Address:
                              fetchedData?.address ?? 'No address available',
                          Price: fetchedData?.price?? 0, Rate: fetchedData?.rate?? 0.0,
                          
                        ),
                        HotelReviewsScreen(id: fetchedData?.id?? 0,),
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
