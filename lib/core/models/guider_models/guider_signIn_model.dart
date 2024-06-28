
import 'package:epic_expolre/core/api/const_end_ponits.dart';

class GuiderSignInModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String nationalId;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;
  final String message;

  GuiderSignInModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.nationalId,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.message,
  });

  factory GuiderSignInModel.fromJson(Map<String, dynamic> jsonData) {
    return GuiderSignInModel(
      id: jsonData['user'][ApiKey.id],
      email: jsonData['user'][ApiKey.email],
      name: jsonData['user'][ApiKey.name],
      phoneNumber: jsonData['user'][ApiKey.phoneNnumber],
      nationalId: jsonData['user'][ApiKey.nationalId], // Corrected
      isVerified: jsonData['user'][ApiKey.isVerified],
      createdAt: DateTime.parse(jsonData['user'][ApiKey.createdAt]), // Corrected
      updatedAt: DateTime.parse(jsonData['user'][ApiKey.updatedAt]), // Corrected
      token: jsonData[ApiKey.token],
      message: jsonData[ApiKey.message],
    );
  }
}
