part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class GetAllFavoritePlacesLoading extends FavoriteState {}

final class GetAllFavoritePlacesSuccess extends FavoriteState {}

final class GetAllFavoritePlacesFailed extends FavoriteState {}

final class DeletePlaceFromFavoriteLoading extends FavoriteState {}

final class DeletePlaceFromFavoriteSuccess extends FavoriteState {}

final class DeletePlaceFromFavoriteFailed extends FavoriteState {}

final class AddHotelToFavoriteLoading extends FavoriteState {}

final class AddHotelToFavoriteSuccess extends FavoriteState {}

final class AddHotelToFavoriteFailed extends FavoriteState {}

final class AddPlaceToFavoriteLoading extends FavoriteState {}

final class AddPlaceToFavoriteSuccess extends FavoriteState {}

final class AddPlaceToFavoriteFailed extends FavoriteState {}
