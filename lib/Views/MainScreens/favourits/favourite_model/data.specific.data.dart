import 'place_by_id.specific.data.dart';

class Data {
  PlaceById? placeById;

  Data({this.placeById});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        placeById: json['placeById'] == null
            ? null
            : PlaceById.fromJson(json['placeById'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'placeById': placeById?.toJson(),
      };
}
