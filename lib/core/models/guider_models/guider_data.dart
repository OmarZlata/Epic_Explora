import 'package:epic_expolre/core/api/const_end_ponits.dart';

class GuiderAllData{


  final int id;
  final String name ;
  final String phone;
  final String email;
  final String description;
  final bool isVerified;
  GuiderAllData({required this.id,required this.name,required this.phone,required this.email,required this.description,required this.isVerified,});

  factory GuiderAllData.fromJson(Map<String, dynamic> json) {
    return GuiderAllData(id: json[ApiKey.id], phone: json[ApiKey.phoneNnumber], name: json[ApiKey.name], description: json[ApiKey.description], isVerified: json[ApiKey.isVerified], email: json[ApiKey.email]

    );
  }


}