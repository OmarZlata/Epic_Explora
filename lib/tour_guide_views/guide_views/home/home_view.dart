import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactRequest {
  final int id;
  final String name;
  final String email;
  final String message;
  final bool isApproved;

  ContactRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.isApproved,
  });

  factory ContactRequest.fromJson(Map<String, dynamic> json) {
    return ContactRequest(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      message: json['message'],
      isApproved: json['is_approved'],
    );
  }
}

class GuidersReq extends StatefulWidget {
  const GuidersReq({super.key});

  @override
  State<GuidersReq> createState() => _GuidersReqState();
}

class PlaceAPI {
  final String baseUrl = EndPoint.baseUrl;

  Future<List<ContactRequest>> getAllTrips() async {
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getData(key: ApiKey.Guidertoken)}",
    });
    final Dio dio = Dio(baseOptions);

    try {
      Response response = await dio.get('${baseUrl}api/guider/get_contact/');
      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        final dynamic allGuidersData = responseData['contact_requests'];

        if (allGuidersData is List) {
          List<ContactRequest> guiders = allGuidersData.map((e) => ContactRequest.fromJson(e)).toList();
          return guiders;
        } else {
          throw Exception('Invalid data format: allGuidersData is not a List');
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

class _GuidersReqState extends State<GuidersReq> {
  List<ContactRequest> allRequests = [];
  bool isLoading = true;
  PlaceAPI placeAPI = PlaceAPI();

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<ContactRequest> fetchedPlaces = await placeAPI.getAllTrips();
      setState(() {
        allRequests = fetchedPlaces;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching places: $e');
      setState(() {
        isLoading = false;
      });
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
          : allRequests.isEmpty
          ? Center(child: Text('There are no requests yet'))
          : ListView.builder(
        itemCount: allRequests.length,
        itemBuilder: (context, index) {
          ContactRequest request = allRequests[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${request.name}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${request.email}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Message: ${request.message}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Approved: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        request.isApproved
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: request.isApproved
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
