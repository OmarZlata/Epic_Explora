class BankModel {
  int? id;
  int? stateId;
  String? name;
  String? location;
  double? rate;
  String? address;

  BankModel({
    this.id,
    this.stateId,
    this.name,
    this.location,
    this.address,
    this.rate,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'],
      stateId: json['state_id'],
      name: json['name'],
      address: json['address'],
      rate: (json['rate'] is int) ? (json['rate'] as int).toDouble() : json['rate'],
      location: json['location'],
    );
  }

  @override
  String toString() {
    return 'BankModel{id: $id, stateId: $stateId, name: $name, location: $location, rate: $rate, address: $address}';
  }
}
