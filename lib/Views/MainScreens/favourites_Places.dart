import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Widgets/FavPlacesCard.dart';
import '../../Widgets/Fav_App_card.dart';
import '../../Widgets/app_AppBar.dart';
import '../../Widgets/app_text.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/models/user_models/FavouriteModel.dart';

class FavouritsPlacesScreen extends StatefulWidget {
  const FavouritsPlacesScreen({super.key});

  @override
  State<FavouritsPlacesScreen> createState() => _FavouritsPlacesScreenState();
}


class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<FavouriteModel>> getAllTrips({int page = 1}) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response =
      await dio.get('${baseUrl}api/user/favorite/places_fav');
      if (response.statusCode == 200) {
        List data = response.data['data'];
        log("data text${data}");

        List<FavouriteModel> x =
        data.map((e) => FavouriteModel.fromJson(e)).toList();

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


class _FavouritsPlacesScreenState extends State<FavouritsPlacesScreen> {
  List<FavouriteModel>? favouritemodel;
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
      List<FavouriteModel> fetchedPlaces =
      await placeAPI.getAllTrips(page: currentPage);
      setState(() {
        favouritemodel = fetchedPlaces;
        isloading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      favouritemodel = null;
      isloading = true;
    });
    _fetchPlaces();
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        favouritemodel = null;
        isloading = true;
      });
      _fetchPlaces();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: isloading
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(title: "Loading...")
          ],
        ),
      )
          : ListView.builder(
        itemCount: favouritemodel!.length,
        itemBuilder: (context, index) => FavPlacesCard(
          cardText: favouritemodel![index].name!,
          cardAddress: favouritemodel![index].address!,
          cardimgUrl: favouritemodel![index].img_url!,
          cardid: favouritemodel![index].id!,
        ),
      ),
    );
  }
}
