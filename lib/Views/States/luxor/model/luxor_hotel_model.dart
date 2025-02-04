class LuxorHotels {
  int? id;
  int? stateId;
  String? name;
  String? description;
  String? address;
  List? img_url;
  double? rate;
  int? price;
  bool? status;


  LuxorHotels({
    this.id,
    this.stateId,
    this.name,
    this.description,
    this.address,
    this.img_url,
    this.rate,
    this.price,
    this.status
  });
  factory LuxorHotels.fromJson(Map<String, dynamic> json) {
    return LuxorHotels(
      id: json['id'],
      stateId: json['state_id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
      rate: (json['rate'] is int) ? (json['rate'] as int).toDouble() : json['rate'],
      price: json['price'],
      status: json['status'],
    );
  }
  @override
  String toString() {
    return 'AlexTrip{id: $id, stateId: $stateId, name: $name, description: $description}';
  }
}
