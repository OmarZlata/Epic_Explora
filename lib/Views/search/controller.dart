import 'package:epic_expolre/core/api/AllplacesAPI.dart';



class PlaceController {
  List<AllPlaces> filterPlaces(String query, List<AllPlaces> places) {
    if (query.isEmpty) {
      return places;
    }

    return places.where((place) {
      final nameLower = place.name!.toLowerCase();
      final addressLower = place.address!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) || addressLower.contains(searchLower);
    }).toList();
  }
}
