import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/add_hotel_to_favorite_model.dart';
import '../model/add_place_to_favorite_model.dart';
import '../model/delete_place_from_favorite_model.dart';
import '../model/favorite_places.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  List<FavoritePlaces> favoritePlacesList = [];
  DeletePlaceFromFavoriteModel? deletePlaceFromFavoriteModel;
  AddPlaceToFavoriteModel? addPlaceToFavoriteModel;
  AddHotelToFavoriteModel? addHotelToFavoriteModel;
  final dio = Dio();
  final String token = '260|A3SVALJeb64fTNkP12tz1O0RYiVaKurGuns075lIa13556bb';

  Future<void> getFavoritePlaces() async {
    emit(GetAllFavoritePlacesLoading());
    const String endpoint = 'https://epic-explore.vercel.app/api/api/user/favorite/getFavorites';

    try {
      final response = await dio.get(endpoint, options: Options(headers: {'Authorization': 'Bearer $token'}));
      favoritePlacesList =
          await (response.data['data']).map<FavoritePlaces>((x) => FavoritePlaces.fromJson(x)).toList();

      emit(GetAllFavoritePlacesSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(GetAllFavoritePlacesFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAllFavoritePlacesFailed());
    }
  }

  Future<void> deletePlaceFromFavorite({required String placeId}) async {
    emit(DeletePlaceFromFavoriteLoading());
    String endpoint = 'https://epic-explore.vercel.app/api/api/user/favorite/delete/$placeId';
    try {
      final response = await dio.post(endpoint, options: Options(headers: {'Authorization': 'Bearer $token'}));

      deletePlaceFromFavoriteModel = DeletePlaceFromFavoriteModel.fromJson(response.data);
      emit(DeletePlaceFromFavoriteSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(DeletePlaceFromFavoriteFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(DeletePlaceFromFavoriteFailed());
    }
  }

  Future<void> addHotelToFavorite({required String hotelId}) async {
    emit(AddHotelToFavoriteLoading());
    String endpoint = 'https://epic-explore.vercel.app/api/api/user/favorite/add/hotel/$hotelId';
    try {
      final response = await dio.post(endpoint, options: Options(headers: {'Authorization': 'Bearer $token'}));

      addHotelToFavoriteModel = AddHotelToFavoriteModel.fromJson(response.data);
      emit(AddHotelToFavoriteSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(AddHotelToFavoriteFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(AddHotelToFavoriteFailed());
    }
  }

  Future<void> addPlaceToFavorite({required String placeId}) async {
    emit(AddPlaceToFavoriteLoading());
    String endpoint = 'https://epic-explore.vercel.app/api/api/user/favorite/add/place/$placeId';
    try {
      final response = await dio.post(endpoint, options: Options(headers: {'Authorization': 'Bearer $token'}));

      addPlaceToFavoriteModel = AddPlaceToFavoriteModel.fromJson(response.data);
      emit(AddPlaceToFavoriteSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(AddPlaceToFavoriteFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(AddPlaceToFavoriteFailed());
    }
  }
}
