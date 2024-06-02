class FavouriteModel {
  int? id;
  String? name;
  String? type;
  String? address;
  List? img_url;

  FavouriteModel({
    this.id,
    this.name,
    this.type,
    this.address,
    this.img_url,
  });
  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      address: json['address'],
      img_url: json['img_url'] ?? [],);
  }
  @override
  String toString() {
    return 'FavouriteModel{id: $id, address: $address, name: $name, type: $type}';
  }
}
