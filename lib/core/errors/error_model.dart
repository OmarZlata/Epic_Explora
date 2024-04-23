

import '../api/const_end_ponits.dart';

class ErrorModel {
  final bool success;
  final String errorMessage;

  ErrorModel({required this.success, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      success: jsonData[ApiKey.success],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}
