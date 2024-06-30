import 'package:epic_expolre/core/api/const_end_ponits.dart';

class TourGuiderSignUpModel{


  final String message;
  TourGuiderSignUpModel( {required this.message});

  factory TourGuiderSignUpModel.fromJson(Map<String, dynamic> json) {
    return TourGuiderSignUpModel(
        message: json[ApiKey.message],
    );
  }


}