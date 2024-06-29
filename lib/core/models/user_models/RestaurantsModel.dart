class RestaurantsModel {
  int? id;
  int? stateId;
  String? name;
  String? address;
  List? img_url;
  double? rate;

  RestaurantsModel({
    this.id,
    this.stateId,
    this.name,
    this.address,
    this.img_url,
    this.rate,
  });
  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
      id: json['id'],
      stateId: json['state_id'],
      name: json['name'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
      rate: json['rate'] != null ? json['rate'].toDouble() : null,
    );
  }
  @override
  String toString() {
    return 'RestaurantsModel{id: $id, stateId: $stateId, name: $name,}';
  }
}