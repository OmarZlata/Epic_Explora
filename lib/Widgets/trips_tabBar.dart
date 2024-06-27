import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/core/models/guider_data.dart';
import 'package:flutter/material.dart';

  class OurGuiders extends StatefulWidget {
  const OurGuiders({super.key});

  @override
  State<OurGuiders> createState() => _OurGuidersState();
}
class DataAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<GuiderAllData>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
      "Accept-Encoding": "gzip, deflate, br",
      'Content-Type': 'application/json',
      "Accept": "application/json"
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/user/place');
      if (response.statusCode == 200) {
        List data = response.data['allPlaces'];
        log("data text${data}");

        List<GuiderAllData> x = data.map((e) => GuiderAllData.fromJson(e)).toList();

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
class _OurGuidersState extends State<OurGuiders> {
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<GuiderAllData> fetchedPlaces = await DataAPI.getAllTrips();
      setState(() {

      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(
          title: "Our Guiders",
          textColor: AppColors.black,
          iconThemeColor: AppColors.black,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: guiderData.length,
          itemBuilder: (context, index) {
            GuiderAllData data = guiderData[index];
            return Column(
              children: [
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.black.withOpacity(.12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/profilepic.jfif",
                            width: 104,
                            height: 104,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city_rounded,
                                  size: 18,
                                  color: AppColors.blue,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  data.description,
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "  Available  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14,)
              ],
            );
          },
        ),
      ),
    );
  }
}
