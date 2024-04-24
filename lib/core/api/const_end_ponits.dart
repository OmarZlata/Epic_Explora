class EndPoint {
  static String baseUrl = "https://f870-156-197-95-10.ngrok-free.app/";
  static String signIn = "api/user/login/";
  static String register = "api/user/register";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String success = 'success' ;
  static String img = "image";
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
