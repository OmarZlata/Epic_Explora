import 'package:epic_expolre/core/api/const_end_ponits.dart';

class SignInModel {
  final String message;
  final String token;

  final int id ;
  final String name ;
  final String email;


  SignInModel(
      { required this.id, required this.name,required this.email,required this.message,required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token],
      id: jsonData[ApiKey.id],
      email: jsonData[ApiKey.email],
      name: jsonData[ApiKey.name],
    );
  }
}
