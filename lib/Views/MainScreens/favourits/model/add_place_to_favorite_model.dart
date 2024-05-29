class AddPlaceToFavoriteModel {
  bool? success;
  String? message;

  AddPlaceToFavoriteModel({
    this.success,
    this.message,
  });
  AddPlaceToFavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
