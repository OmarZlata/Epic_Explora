import 'package:epic_expolre/core/api/const_end_ponits.dart';

class LogoutModel{
 String? message ;

  LogoutModel({required message});



  factory LogoutModel.fromjson(Map<String,dynamic>jsonData){
    return LogoutModel(
      message:jsonData[ApiKey.message]
    );
  }
}