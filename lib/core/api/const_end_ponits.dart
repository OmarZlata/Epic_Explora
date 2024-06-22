import 'package:epic_expolre/core/models/sign_up_model.dart';

class EndPoint {
  static String baseUrl = "https://tour-guide-api.onrender.com/";
  static String signIn = "api/user/login/";
  static String register = "api/user/register/";
  static String logout = "api/user/logout/";
  static String forgot_password = "api/user/forgot_password/";
  static String reset_password = "api/user/reset_pass/";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String success = 'success';
  static String img = "image";
  static String updatedAt = "updated_at";
  static String createdAt = "created_at";
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String confirmNewPassword = "password_confirmation";
  static String newPassword = "password";
  static String token = "token";
  static String otp = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "password_confirmation";
  static String location = "location";
  static String profilePic = "profilePic";
  static String image = "image";
}
