class DeletePlaceFromFavoriteModel {
  bool? success;
  String? message;

  DeletePlaceFromFavoriteModel({
    this.success,
    this.message,
  });
  DeletePlaceFromFavoriteModel.fromJson(Map<String, dynamic> json) {
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
