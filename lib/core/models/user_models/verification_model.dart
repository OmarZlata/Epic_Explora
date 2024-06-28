class VerificationModel {
  final List<Token> token;

  VerificationModel({
    required this.token,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(
      token: (json['data']['token'] as List<dynamic>)
          .map((tokenJson) => Token.fromJson(tokenJson))
          .toList(),
    );
  }
}

class Token {
  final String otp;

  Token({
    required this.otp,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      otp: json['token'],
    );
  }
}
