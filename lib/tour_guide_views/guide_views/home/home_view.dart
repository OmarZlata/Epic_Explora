import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


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

class ContactRequestsScreen extends StatefulWidget {
  const ContactRequestsScreen({Key? key}) : super(key: key);

  @override
  State<ContactRequestsScreen> createState() => _ContactRequestsScreenState();
}

class _ContactRequestsScreenState extends State<ContactRequestsScreen> {
  late Future<List<ContactRequest>> _contactRequests;

  Future<List<ContactRequest>> fetchContactRequests() async {
    final token = CacheHelper().getData(key: ApiKey.token);
    final response = await Dio().get(
      'https://tour-guide-api.onrender.com/api/guider/get_contact/',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['contact_requests'];
      return data.map((json) => ContactRequest.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contact requests');
    }
  }

  @override
  void initState() {
    super.initState();
    _contactRequests = fetchContactRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Requests',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<ContactRequest>>(
        future: _contactRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.blue),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No contact requests found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ContactRequest request = snapshot.data![index];
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
            );
          }
        },
      ),
    );
  }
}
