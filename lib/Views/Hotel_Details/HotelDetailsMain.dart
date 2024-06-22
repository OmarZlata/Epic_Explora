import 'dart:math';
import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/Hotel_Details/HotelDetails.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_text.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';
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

  Future<Map<String, dynamic>?> getplaceinfo() async {
    final baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getDataString(key: ApiKey.token)}",
    });
    Dio dio = Dio(baseOptions);

    try {
      print('Making API call to: ${baseUrl}api/user/hotel/get-hotel/$cardid');
      Response response = await dio.get('${baseUrl}api/user/hotel/get-hotel/$cardid');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        var data = response.data['data'];
        if (data != null && data is List && data.isNotEmpty) {
          return data[0];
        } else {
          print('No data available in response');
          throw Exception('No data available in response');
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API call: $e');
      rethrow;
    }
  }
}

class _HotelsDetailsState extends State<HotelsDetails>
    with SingleTickerProviderStateMixin {
  late DetailsHotelsApi detailsHotelsApi;
  Map<String, dynamic>? fetchedData;
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
    print('Starting to fetch data');
    try {
      Map<String, dynamic>? fetchedData = await detailsHotelsApi.getplaceinfo();
      if (fetchedData != null) {
        print('Fetched data: $fetchedData');
        setState(() {
          this.fetchedData = fetchedData;
          isloading = false;
        });
        print('State updated with fetched data');
      } else {
        print('Fetched data is null');
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    if (fetchedData != null && fetchedData!['img_url'] != null && fetchedData!['img_url']!.isNotEmpty) {
      imageUrl = fetchedData!['img_url'][0];
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
                title: Text(
                  fetchedData?['name'] ?? 'Loading...',
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
                    fetchedData?['address'] ?? 'No address available',
                    Price: fetchedData?['price'] ?? 0,
                    Rate: (fetchedData?['rate'] ?? 0).toDouble(), // Cast to double
                    ID: fetchedData?['id'] ?? 0,
                    Name: fetchedData?['name'] ?? 'No name',
                    status: fetchedData!['status']?? false,

                  ),
                  HotelReviewsScreen(id: fetchedData?['id'] ?? 0),
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
