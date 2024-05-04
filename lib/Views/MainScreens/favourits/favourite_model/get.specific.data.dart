import 'data.specific.data.dart';
import 'errors.specific.data.dart';

class Get {
  bool? success;
  String? message;
  Data? data;
  Errors? errors;

  Get({this.success, this.message, this.data, this.errors});

  factory Get.fromJson(Map<String, dynamic> json) => Get(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        errors: json['errors'] == null
            ? null
            : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
        'errors': errors?.toJson(),
      };
}
