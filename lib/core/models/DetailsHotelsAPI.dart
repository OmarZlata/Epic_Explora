class DetailsHotels {
  int? id;
  String? name;
  String? address;
  List? img_url;
  double? rate;
  int? price;

  DetailsHotels({
    this.id,
    this.name,
    this.address,
    this.img_url,
    this.rate,
    this.price

  });
  factory DetailsHotels.fromJson(Map<String, dynamic> json) {
    return DetailsHotels(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      img_url: json['img_url'] ?? [],
      rate: json['rate'],
      price: json['price'],
    );
  }
  @override
  String toString() {
    return 'DetailsHotels{id: $id, name: $name,address: $address,img_url: $img_url,rate: $rate,price: $price}';
  }
}
