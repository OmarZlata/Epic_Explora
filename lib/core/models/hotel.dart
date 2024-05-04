class Hotel {
  final int id;
  final String name;
  final String address;
  final String type;
  final List<String> imageUrl;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.type,
    required this.imageUrl,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      type: json['type'] ?? '',
      imageUrl: json['img_url'] != null
          ? List<String>.from(json['img_url'].map((x) => x))
          : [],
    );
  }
}
