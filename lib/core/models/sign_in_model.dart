import 'package:epic_expolre/core/api/const_end_ponits.dart';

class SignInModel {
  final String message;
  final String token;
  final String img ;
  final int id ;
  final String name ;
  final String email;


  SignInModel(
      {required this.img, required this.id, required this.name,required this.email,required this.message,required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      token: jsonData['data']['token'][ApiKey.token],
      img: jsonData['data']['user'][ApiKey.img],
      id: jsonData['data']['user'][ApiKey.id],
      email: jsonData['data']['user'][ApiKey.email],
      name: jsonData['data']['user'][ApiKey.name],
    );
  }
}
