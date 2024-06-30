class ContactRequest {
  final int id;
  final String name;
  final String email;
  final String message;
  final bool isApproved;

  ContactRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.isApproved,
  });

  factory ContactRequest.fromJson(Map<String, dynamic> json) {
    return ContactRequest(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      message: json['message'],
      isApproved: json['is_approved'],
    );
  }
}
