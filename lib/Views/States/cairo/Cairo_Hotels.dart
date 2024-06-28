import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/core/models/user_models/CairoHotelsApi.dart';
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


class CairoHotelsView extends StatefulWidget {
  const CairoHotelsView({Key? key}) : super(key: key);

  @override
  State<CairoHotelsView> createState() => _CairoHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<CairoHotels>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/hotel/cairo');
      if (response.statusCode == 200) {
        List data = response.data['hotels'];
        log("data text: $data");

        List<CairoHotels> hotels = data.map((e) => CairoHotels.fromJson(e)).toList();

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

class _CairoHotelsViewState extends State<CairoHotelsView> {
  List<CairoHotels> allCairoHotels = [];
  List<CairoHotels> displayedCairoHotels = [];
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
      List<CairoHotels> fetchedHotels = await placeAPI.getAllTrips();
      setState(() {
        allCairoHotels = fetchedHotels;
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
      displayedCairoHotels = allCairoHotels.sublist(start, end > allCairoHotels.length ? allCairoHotels.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < allCairoHotels.length) {
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
        itemCount: displayedCairoHotels.length,
        itemBuilder: (context, index) => ApiHotelCard(
          cardText: displayedCairoHotels[index].name!,
          cardAddress: displayedCairoHotels[index].address!,
          cardimgUrl: displayedCairoHotels[index].img_url!,
          cardid: displayedCairoHotels[index].id!,
          price: displayedCairoHotels[index].price!,
          rate: displayedCairoHotels[index].rate!,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                goToPreviousPage();
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(2)
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(width: 35), // Adjust space between previous button and current page indicator
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColors.blue),
              ),
              child: Text('$currentPage'),
            ),
            SizedBox(width: 35), // Adjust space between current page indicator and next button
            InkWell(
              onTap: () {
                goToNextPage();
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(2)
                ),
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
