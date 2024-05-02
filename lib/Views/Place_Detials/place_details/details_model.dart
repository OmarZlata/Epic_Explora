class Place {
  bool? success;
  String? message;
  Data? data;
  Errors? errors;

  Place({this.success, this.message, this.data, this.errors});

  Place.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Data {
  PlaceById? placeById;

  Data({this.placeById});

  Data.fromJson(Map<String, dynamic> json) {
    placeById = json['placeById'] != null ? new PlaceById.fromJson(json['placeById']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.placeById != null) {
      data['placeById'] = this.placeById!.toJson();
    }
    return data;
  }
}

class PlaceById {
  int? id;
  int? stateId;
  String? name;
  String? description;
  String? address;
  List<String>? imgUrl;
  int? averageRating;

  PlaceById({this.id, this.stateId, this.name, this.description, this.address, this.imgUrl, this.averageRating});

  PlaceById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    imgUrl = json['img_url'].cast<String>();
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state_id'] = this.stateId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['img_url'] = this.imgUrl;
    data['average_rating'] = this.averageRating;
    return data;
  }
}

class Errors {



Errors.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}
