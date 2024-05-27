import 'package:epic_expolre/Views/search/controller.dart';
import 'package:epic_expolre/core/api/AllplacesAPI.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../Widgets/API_App_card.dart';
import '../../../cache/cache_helper.dart';
import '../../../core/api/const_end_ponits.dart';
import '../../../core/app_colors/app_colors.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:epic_expolre/Widgets/app_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AllPlaces>> getAllTrips({int page = 1}) async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.token)}",
      "Accept-Encoding": "gzip, deflate, br",
      'Content-Type': 'application/json',
      "Accept": "application/json"
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}/api/user/place?page=$page');
      if (response.statusCode == 200) {
        List data = response.data['data']['allPlaces'];
        log("data text${data}");

        List<AllPlaces> x = data.map((e) => AllPlaces.fromJson(e)).toList();

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

class _SearchScreenState extends State<SearchScreen> {
  List<AllPlaces>? allplaces;
  List<AllPlaces>? filteredPlaces;
  bool isloading = true;
  PlaceAPI placeAPI = PlaceAPI();
  int currentPage = 1;
  String searchQuery = '';

  final PlaceController placeController = PlaceController();

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<AllPlaces> fetchedPlaces = await placeAPI.getAllTrips(page: currentPage);
      setState(() {
        allplaces = fetchedPlaces;
        filteredPlaces = fetchedPlaces;
        isloading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void goToNextPage() {
    setState(() {
      currentPage += 1;
      allplaces = null;
      isloading = true;
    });
    _fetchPlaces();
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        allplaces = null;
        isloading = true;
      });
      _fetchPlaces();
    }
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredPlaces = placeController.filterPlaces(query, allplaces ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(title: "Search"),
        body: isloading
            ? Center(
            child: CircularProgressIndicator(
              color: AppColors.blue,
            ))
            : Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  updateSearchQuery(value);
                },
                maxLines: 1,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blue), // Override the focused border color
                    ),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search,color: AppColors.blue),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(14),
                  itemCount: filteredPlaces!.length,
                  itemBuilder: (context, index) => APIAppCard(
                    cardText: filteredPlaces![index].name!,
                    cardAddress: filteredPlaces![index].address!,
                    cardimgUrl: filteredPlaces![index].img_url!,
                    cardid: filteredPlaces![index].id!,
                  ),
                ),
              ),
            ],
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: AppColors.grey)),
                  child: AppText(
                    title: 'Page $currentPage',
                    fontWeight: FontWeight.bold,
                  )),
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
      ),
    );
  }
}