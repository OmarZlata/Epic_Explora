class PlaceById {
  int? id;
  int? stateId;
  String? name;
  String? description;
  String? address;
  List<String>? imgUrl;
  int? averageRating;

  PlaceById({
    this.id,
    this.stateId,
    this.name,
    this.description,
    this.address,
    this.imgUrl,
    this.averageRating,
  });

  factory PlaceById.fromJson(Map<String, dynamic> json) => PlaceById(
        id: json['id'] as int?,
        stateId: json['state_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        address: json['address'] as String?,
        imgUrl: json['img_url'] as List<String>?,
        averageRating: json['average_rating'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'state_id': stateId,
        'name': name,
        'description': description,
        'address': address,
        'img_url': imgUrl,
        'average_rating': averageRating,
      };
}
