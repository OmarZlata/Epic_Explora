import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/API_App_card.dart';
import '../../../Widgets/API_Hotel_Card.dart';
import '../../../cache/cache_helper.dart';
import '../../../core/api/AlexTripAPI.dart';
import '../../../core/api/const_end_ponits.dart';
import 'model/luxor_hotel_model.dart';

class LuxorHotelsView extends StatefulWidget {
  const LuxorHotelsView({Key? key}) : super(key: key);

  @override
  State<LuxorHotelsView> createState() => _LuxorHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<LuxorHotels>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/hotel/luxor');
      if (response.statusCode == 200) {
        List data = response.data['hotels'];
        log("data text${data}");

        List<LuxorHotels> hotels = data.map((e) => LuxorHotels.fromJson(e)).toList();

        return hotels;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      log("${e.response}");

      throw Exception('${e.toString()}');
    }
  }
}

class _LuxorHotelsViewState extends State<LuxorHotelsView> {
  List<LuxorHotels> allLuxorHotels = [];
  List<LuxorHotels> displayedLuxorHotels = [];
  bool isLoading = true;
  PlaceAPI placeAPI = PlaceAPI();
  int currentPage = 1;
  final int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  void _fetchHotels() async {
    try {
      List<LuxorHotels> fetchedHotels = await placeAPI.getAllTrips();
      setState(() {
        allLuxorHotels = fetchedHotels;
        _updateDisplayedHotels();
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching hotels: $e');
    }
  }

  void _updateDisplayedHotels() {
    int start = (currentPage - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    setState(() {
      displayedLuxorHotels = allLuxorHotels.sublist(start, end > allLuxorHotels.length ? allLuxorHotels.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < allLuxorHotels.length) {
      setState(() {
        currentPage += 1;
        _updateDisplayedHotels();
      });
    }
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        _updateDisplayedHotels();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue))
          : ListView.builder(
        itemCount: displayedLuxorHotels.length,
        itemBuilder: (context, index) => ApiHotelCard(
          cardText: displayedLuxorHotels[index].name!,
          cardAddress: displayedLuxorHotels[index].address!,
          cardimgUrl: displayedLuxorHotels[index].img_url!,
          cardid: displayedLuxorHotels[index].id!,
          price: displayedLuxorHotels[index].price!,
          rate: displayedLuxorHotels[index].rate!,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                goToPreviousPage();
              },
              child: CircleAvatar(
                backgroundColor: AppColors.blue,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.grey)),
                child: Text('$currentPage')),
            InkWell(
              onTap: () {
                goToNextPage();
              },
              child: CircleAvatar(
                backgroundColor: AppColors.blue,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
