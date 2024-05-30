class UserInfo {
  String? name;
  String? email;
  String? avatar;

  UserInfo({this.avatar, this.email, this.name});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      avatar: json['avatar'],
      email: json['email'],
      name: json['name'],
    );
  }
}
