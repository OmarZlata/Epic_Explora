class GuiderData {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String description;
  final bool isVerified;

  GuiderData({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.description,
    required this.isVerified,
  });

  // Factory constructor to create a GuiderData instance from JSON
  factory GuiderData.fromJson(Map<String, dynamic> json) {
    return GuiderData(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      description: json['description'],
      isVerified: json['is_verified'],
    );
  }

  // Method to convert a GuiderData instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'description': description,
      'is_verified': isVerified,
    };
  }
}
