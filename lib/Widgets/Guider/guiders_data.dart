import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Views/TourGuider/GuiderCard.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/models/user_models/guider_all_model.dart';

class OurGuiders extends StatefulWidget {
  const OurGuiders({super.key});

  @override
  State<OurGuiders> createState() => _OurGuidersState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<GuiderData>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/guider_data/guider_all_data');
      if (response.statusCode == 200) {
        print(response.data);

        final dynamic responseData = response.data;
        final dynamic allGuiderssData = responseData['guider_data'];

        if (allGuiderssData is List) {
          List<GuiderData> guiders = allGuiderssData.map((e) => GuiderData.fromJson(e)).toList();
          return guiders;
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

class _OurGuidersState extends State<OurGuiders> {
  List<GuiderData> allGuiders = [];
  bool isLoading = true;
  PlaceAPI placeAPI = PlaceAPI();

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<GuiderData> fetchedPlaces = await placeAPI.getAllTrips();
      setState(() {
        allGuiders = fetchedPlaces;
        isLoading = false;
      });
      for (var guider in fetchedPlaces) {
        CacheHelper().saveData(key: '${ApiKey.GuiderId}_${guider.id}', value: guider.id);
      }
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: AppColors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.white,
        elevation: 1,
        title: Text(
          "Guiders",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue))
          : ListView.builder(
        itemCount: allGuiders.length,
        itemBuilder: (context, index) => GuiderCard(
          id: allGuiders[index].id!,
          name: allGuiders[index].name!,
          description: allGuiders[index].description!,
          email: allGuiders[index].email!,
          isVerified: allGuiders[index].isVerified!,
          phoneNumber: allGuiders[index].phoneNumber!,
        ),
      ),
    );
  }
}
