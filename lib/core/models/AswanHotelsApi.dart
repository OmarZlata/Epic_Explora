class AswanHotels {
  int? id;
  int? stateId;
  String? name;
  String? description;
  String? address;
  List? img_url;
  int? rate;
  int? price;
  bool? status;


  AswanHotels({
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
  factory AswanHotels.fromJson(Map<String, dynamic> json) {
    return AswanHotels(
      id: json['id'],
      stateId: json['state_id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
      rate: json['rate'],
      price: json['price'],
      status: json['status'],
    );
  }
  @override
  String toString() {
    return 'AlexTrip{id: $id, stateId: $stateId, name: $name, description: $description}';
  }
}
