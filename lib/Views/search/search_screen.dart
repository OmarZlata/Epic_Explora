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
import 'package:epic_expolre/Widgets/app_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.title, required this.states});

  final String title, states;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<AllPlaces>> getAllTrips() async {
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
  List<AllPlaces>? allPlaces;
  List<AllPlaces>? filteredPlaces;
  List<AllPlaces>? displayedPlaces;
  bool isLoading = true;
  PlaceAPI placeAPI = PlaceAPI();
  int currentPage = 1;
  final int itemsPerPage = 10;
  String searchQuery = '';

  final PlaceController placeController = PlaceController();

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<AllPlaces> fetchedPlaces = await placeAPI.getAllTrips();
      setState(() {
        allPlaces = fetchedPlaces;
        filteredPlaces = allPlaces!.where((element) => element.address == widget.states).toList();
        _updateDisplayedPlaces();
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  void _updateDisplayedPlaces() {
    int start = (currentPage - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    setState(() {
      displayedPlaces = filteredPlaces!.sublist(start, end > filteredPlaces!.length ? filteredPlaces!.length : end);
    });
  }

  void goToNextPage() {
    if (currentPage * itemsPerPage < filteredPlaces!.length) {
      setState(() {
        currentPage += 1;
        _updateDisplayedPlaces();
      });
    }
  }

  void goToPreviousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage -= 1;
        _updateDisplayedPlaces();
      });
    }
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredPlaces = placeController.filterPlaces(query, allPlaces ?? []);
      _updateDisplayedPlaces();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(title: "Search"),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(
            color: AppColors.blue,
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  updateSearchQuery(value);
                },
                maxLines: 1,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, color: AppColors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: displayedPlaces?.length ?? 0,
                  itemBuilder: (context, index) => APIAppCard(
                    cardText: displayedPlaces![index].name!,
                    cardAddress: displayedPlaces![index].address!,
                    cardimgUrl: displayedPlaces![index].img_url!,
                    cardid: displayedPlaces![index].id!,
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
