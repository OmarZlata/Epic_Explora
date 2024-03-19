class Location {
  final String district;
  final String region;
  final String country;
  final String timezone;

  Location({required this.district, required this.region, required this.country, required this.timezone,});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      district: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      timezone: json['location']['tz_id'],
    );
  }
}
