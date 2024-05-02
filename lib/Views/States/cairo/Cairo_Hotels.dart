import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/API_App_card.dart';
import '../../../core/api/AlexTripAPI.dart';
import '../../../core/api/const_end_ponits.dart';
import '../../../core/models/CairoHotelsApi.dart';

class CairoHotelsView extends StatefulWidget {
  const CairoHotelsView({Key? key});

  @override
  State<CairoHotelsView> createState() => _CairoHotelsViewState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<CairoHotels>> getAllTrips({int page = 1}) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer 15|itUINYzlaSxfVOyDVMUjhlRrl2civqwiVs1yLwnTa95864a8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/hotel/cairo?page=$page');
      if (response.statusCode == 200) {
        List data = response.data['data']['hotels'];
        log("data text${data}");

        List<CairoHotels> x = data.map((e) => CairoHotels.fromJson(e)).toList();

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

class _CairoHotelsViewState extends State<CairoHotelsView> {
  List<CairoHotels>? cairohotels;
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
      List<CairoHotels> fetchedPlaces = await placeAPI.getAllTrips(page: currentPage);
      setState(() {
        cairohotels = fetchedPlaces;
        isloading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      cairohotels = null;
      isloading = true;
    });
    _fetchPlaces();
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        cairohotels = null;
        isloading = true;
      });
      _fetchPlaces();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: cairohotels!.length,
        itemBuilder: (context, index) => APIAppCard(
          cardText: cairohotels![index].name!,
          cardAddress: cairohotels![index].address!,
          cardimgUrl: cairohotels![index].img_url!,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.blue)),
              onPressed: goToPreviousPage,
              child: Text('Previous Page'),
            ),
            Text('Page $currentPage'),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.blue)),
              onPressed: goToNextPage,
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}