class AddHotelToFavoriteModel {
  bool? success;
  String? message;

  AddHotelToFavoriteModel({
    this.success,
    this.message,
  });
  AddHotelToFavoriteModel.fromJson(Map<String, dynamic> json) {
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
