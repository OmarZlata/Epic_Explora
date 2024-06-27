class AllPlaces{
  int? id;
  String? name;
  String? description;
  String? address;
  List?img_url;
  AllPlaces({ this.id,
    this.name,
    this.description,
    this.address,
    this.img_url,});

  factory AllPlaces.fromJson(Map<String, dynamic> json) {
    return AllPlaces(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
    );
  }
  @override
  String toString() {
    return 'AllPlaces{id: $id, name: $name, description: $description}';
  }

}