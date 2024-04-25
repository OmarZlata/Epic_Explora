import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/API_App_card.dart';
import '../../../core/api/AlexTripAPI.dart';
import '../../../core/api/const_end_ponits.dart';

class TripsView extends StatefulWidget {
  const TripsView({super.key});
  

  @override
  State<TripsView> createState() => _TripsViewState();
}
List<AlexTrip>? alextrip;
bool isloading =true;
PlaceAPI placeAPI = PlaceAPI();
@override




class PlaceAPI{
  final String baseUrl = EndPoint.baseUrl;
  Future<List<AlexTrip>>getAllTrips()async{
    final BaseOptions baseOptions= BaseOptions(headers: {"Authorization":
    "Bearer 15|itUINYzlaSxfVOyDVMUjhlRrl2civqwiVs1yLwnTa95864a8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",});
    final Dio dio = Dio(baseOptions);
    try{
      Response response = await dio.get('${baseUrl}api/user/place/Alexandria');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        var x = data.map((e) => AlexTrip.fromJson(e)).toList();
        isloading=false;

        return x;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    
  }
}


class _TripsViewState extends State<TripsView> {
  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }
  void _fetchPlaces() async {
    try {
      List<AlexTrip> fetchedPlaces = await placeAPI.getAllTrips();
      setState(() {
        alextrip = fetchedPlaces;
        log("${alextrip}");

      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: alextrip!.length,
        itemBuilder: (context, index) => APIAppCard(cardText: alextrip![index].name!, cardAddress: alextrip![index].address!, cardimgUrl: alextrip![index].img_url!,


      ),
    ));
  }
}
