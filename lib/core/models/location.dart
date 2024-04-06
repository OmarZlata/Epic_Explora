class Location {
  final String district;
  final String region;
  final String country;

  Location({required this.district, required this.region, required this.country,});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      district: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
    );
  }
}
