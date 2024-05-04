import 'hotel_review_model.dart';

abstract class HotelReviewState {
  const HotelReviewState();
}

class HotelReviewInitial extends HotelReviewState {}

class HotelReviewLoading extends HotelReviewState {}

class HotelReviewLoaded extends HotelReviewState {
  final HotelReview hotelReview;

  const HotelReviewLoaded(this.hotelReview);
}

class HotelReviewError extends HotelReviewState {
  final String message;

  const HotelReviewError(this.message);
}
