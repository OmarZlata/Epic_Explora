import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/API_App_card.dart';
import '../../../cache/cache_helper.dart';
import '../../../core/api/AlexTripAPI.dart';
import '../../../core/api/const_end_ponits.dart';
import '../../../core/models/AswanHotelsApi.dart';
import '../../../core/models/CairoHotelsApi.dart';

class AswanHotelsView extends StatefulWidget {
  const AswanHotelsView({Key? key});

  @override
  State<AswanHotelsView> createState() => _AswanHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AswanHotels>> getAllTrips({int page = 1}) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response =
          await dio.get('${baseUrl}api/user/hotel/aswan?page=$page');
      if (response.statusCode == 200) {
        List data = response.data['data']['hotels'];
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
  List<AswanHotels>? aswanhotels;
  bool isloading = true;
  PlaceAPI placeAPI = PlaceAPI();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<AswanHotels> fetchedPlaces =
          await placeAPI.getAllTrips(page: currentPage);
      setState(() {
        aswanhotels = fetchedPlaces;
        isloading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      aswanhotels = null;
      isloading = true;
    });
    _fetchPlaces();
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        aswanhotels = null;
        isloading = true;
      });
      _fetchPlaces();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue,))
          : ListView.builder(
              itemCount: aswanhotels!.length,
              itemBuilder: (context, index) => APIAppCard(
                cardText: aswanhotels![index].name!,
                cardAddress: aswanhotels![index].address!,
                cardimgUrl: aswanhotels![index].img_url!,
                cardid: aswanhotels![index].id!,
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
