import 'package:dio/dio.dart';
import 'package:epic_expolre/Widgets/API_Hotel_Card.dart';
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

class HotelsView extends StatefulWidget {
  const HotelsView({Key? key});

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AlexTrip>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response =
      await dio.get('${baseUrl}api/user/hotel/Alexandria');
      if (response.statusCode == 200) {
        List data = response.data['hotels'];
        log("data text: $data");

        List<AlexTrip> trips = data.map((e) => AlexTrip.fromJson(e)).toList();

        return trips;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      log("${e.response}");

      throw Exception('${e.toString()}');
    }
  }
}

class _HotelsViewState extends State<HotelsView> {
  List<AlexTrip> allAlexTrips = [];
  List<AlexTrip> displayedAlexTrips = [];
  bool isLoading = true;
  PlaceAPI placeAPI = PlaceAPI();
  int currentPage = 1;
  final int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _fetchTrips();
  }

  void _fetchTrips() async {
    try {
      List<AlexTrip> fetchedTrips = await placeAPI.getAllTrips();
      setState(() {
        allAlexTrips = fetchedTrips;
        _updateDisplayedTrips();
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching trips: $e');
    }
  }

  void _updateDisplayedTrips() {
    int start = (currentPage - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    setState(() {
      displayedAlexTrips = allAlexTrips.sublist(start, end > allAlexTrips.length ? allAlexTrips.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < allAlexTrips.length) {
      setState(() {
        currentPage += 1;
        _updateDisplayedTrips();
      });
    }
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        _updateDisplayedTrips();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue,))
          : ListView.builder(
        itemCount: displayedAlexTrips.length,
        itemBuilder: (context, index) => ApiHotelCard(
          cardText: displayedAlexTrips[index].name!,
          cardAddress: displayedAlexTrips[index].address!,
          cardimgUrl: displayedAlexTrips[index].img_url!,
          cardid: displayedAlexTrips[index].id!,
          price: displayedAlexTrips[index].price!,
          rate: displayedAlexTrips[index].rate!,
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
