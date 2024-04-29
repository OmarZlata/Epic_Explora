class EndPoint {
  static String baseUrl = "https://04e2-197-35-194-56.ngrok-free.app/";
  static String signIn = "api/user/login/";
  static String register = "api/user/register/";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String success = 'success' ;
  static String img = "image";
  static String updatedAt = "updated_at";
  static String createdAt = "created_at";
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "password_confirmation";
  static String location = "location";
  static String profilePic = "profilePic";
  static String image ="image";
}
