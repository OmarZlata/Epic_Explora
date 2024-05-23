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
import '../../../core/models/AlexPlacesAPI.dart';
import '../../../core/models/AswanPlacesApi.dart';
import '../../../core/models/CairoPlacesAPI.dart';

class AswanPlacesScreen extends StatefulWidget {
  const AswanPlacesScreen({Key? key});

  @override
  State<AswanPlacesScreen> createState() => _AswanPlacesScreenState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AswanPlaces>> getAllTrips({int page = 1}) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer 15|itUINYzlaSxfVOyDVMUjhlRrl2civqwiVs1yLwnTa95864a8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/place/aswan?page=$page');
      if (response.statusCode == 200) {
        print(response.data);
        final dynamic responseData = response.data;
        final dynamic allPlacesData = responseData['data']['places'];

        if (allPlacesData is List) {
          List<AswanPlaces> places = allPlacesData.map((e) => AswanPlaces.fromJson(e)).toList();
          return places;
        } else {
          throw Exception('Invalid data format: allPlaces is not a List');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      log("${e.response}");
      throw Exception('${e.toString()}');
    }
  }
}

class _AswanPlacesScreenState extends State<AswanPlacesScreen> {
  List<AswanPlaces>? aswanplaces=[];
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
      List<AswanPlaces> fetchedPlaces = await placeAPI.getAllTrips(page: currentPage);
      setState(() {
        aswanplaces = fetchedPlaces;
        isloading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      aswanplaces = null;
      isloading = true;
    });
    _fetchPlaces();
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        aswanplaces = null;
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
        itemCount: aswanplaces!.length,
        itemBuilder: (context, index) => APIAppCard(
          cardText: aswanplaces![index].name!,
          cardAddress: aswanplaces![index].address!,
          cardimgUrl: aswanplaces![index].img_url!,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(onTap: () {
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
            InkWell(onTap: () {
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