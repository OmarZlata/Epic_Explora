class Recommended{
  int? id;
  int? stateId;
  String? name;
  String? description;
  String? address;
  List?img_url;
  double? averageRating;
  Recommended({ this.id,
    this.stateId,
    this.name,
    this.description,
    this.address,
    this.img_url,
    this.averageRating,});

  factory Recommended.fromJson(Map<String, dynamic> json) {
    return Recommended(
      id: json['id'],
      stateId: json['state_id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
      averageRating: json['average_rating'] != null ? json['average_rating'].toDouble() : null,
    );
  }

}