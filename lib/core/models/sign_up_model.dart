import 'package:epic_expolre/core/api/const_end_ponits.dart';

class SignUpModel {
  final String message;
  final String name;

  final String email;

  final int id;

  final String token;

  final String updated_at;
  final String created_at;

  SignUpModel(
      {required this.name,
      required this.email,
      required this.id,
      required this.token,
      required this.updated_at,
      required this.created_at,
      required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        message: jsonData[ApiKey.message],
        name: jsonData['data']['user'][ApiKey.name],
        id: jsonData['data']['user'][ApiKey.id],
        token: jsonData['data'][ApiKey.token],
        email: jsonData['data']['user'][ApiKey.email],
        updated_at: jsonData['data']['user'][ApiKey.updatedAt],
        created_at: jsonData['data']['user'][ApiKey.createdAt]);
  }
}
