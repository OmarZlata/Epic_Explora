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
import '../../../core/models/user_models/AswanHotelsApi.dart';


class AswanHotelsView extends StatefulWidget {
  const AswanHotelsView({Key? key});

  @override
  State<AswanHotelsView> createState() => _AswanHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AswanHotels>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response =
      await dio.get('${baseUrl}api/user/hotel/aswan');
      if (response.statusCode == 200) {
        List data = response.data['hotels'];
        log("data text${data}");

        List<AswanHotels> x = data.map((e) => AswanHotels.fromJson(e)).toList();

        return x;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      log("${e.response}");

      throw Exception('${e.toString()}');
    }
  }
}

class _AswanHotelsViewState extends State<AswanHotelsView> {
  List<AswanHotels> allAswanHotels = [];
  List<AswanHotels> displayedAswanHotels = [];
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
      List<AswanHotels> fetchedHotels =
      await placeAPI.getAllTrips();
      setState(() {
        allAswanHotels = fetchedHotels;
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
      displayedAswanHotels = allAswanHotels.sublist(start, end > allAswanHotels.length ? allAswanHotels.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < allAswanHotels.length) {
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
        itemCount: displayedAswanHotels.length,
        itemBuilder: (context, index) => ApiHotelCard(
          cardText: displayedAswanHotels[index].name!,
          cardAddress: displayedAswanHotels[index].address!,
          cardimgUrl: displayedAswanHotels[index].img_url!,
          cardid: displayedAswanHotels[index].id!,
          price: displayedAswanHotels[index].price!,
          rate: displayedAswanHotels[index].rate!,
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
