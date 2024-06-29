import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/core/models/user_models/RedSeaHotelsAPI.dart';
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


class RedSeaHotelsView extends StatefulWidget {
  const RedSeaHotelsView({Key? key});

  @override
  State<RedSeaHotelsView> createState() => _RedSeaHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<RedSeaHotels>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response =
      await dio.get('${baseUrl}api/user/hotel/red-sea');
      if (response.statusCode == 200) {
        List data = response.data['hotels'];
        log("data text: $data");

        List<RedSeaHotels> hotels =
        data.map((e) => RedSeaHotels.fromJson(e)).toList();

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

class _RedSeaHotelsViewState extends State<RedSeaHotelsView> {
  List<RedSeaHotels> allRedSeaHotels = [];
  List<RedSeaHotels> displayedRedSeaHotels = [];
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
      List<RedSeaHotels> fetchedHotels =
      await placeAPI.getAllTrips();
      setState(() {
        allRedSeaHotels = fetchedHotels;
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
      displayedRedSeaHotels = allRedSeaHotels.sublist(start, end > allRedSeaHotels.length ? allRedSeaHotels.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < allRedSeaHotels.length) {
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
          ? Center(child: CircularProgressIndicator(color: AppColors.blue,))
          : ListView.builder(
        itemCount: displayedRedSeaHotels.length,
        itemBuilder: (context, index) => ApiHotelCard(
          cardText: displayedRedSeaHotels[index].name!,
          cardAddress: displayedRedSeaHotels[index].address!,
          cardimgUrl: displayedRedSeaHotels[index].img_url!,
          cardid: displayedRedSeaHotels[index].id!,
          price: displayedRedSeaHotels[index].price!,
          rate: displayedRedSeaHotels[index].rate!,
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
                border: Border.all(width: 1, color: AppColors.grey),
              ),
              child: Text('$currentPage'),
            ),
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
