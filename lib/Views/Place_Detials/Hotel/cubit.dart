import 'package:bloc/bloc.dart';
import 'package:graduation_project/Views/Place_Detials/Hotel/state.dart';

import 'hotel_review_api.dart';


class HotelReviewCubit extends Cubit<HotelReviewState> {
  final HotelReviewRepository _repository;

  HotelReviewCubit(this._repository) : super(HotelReviewInitial());

  Future<void> fetchHotelReviews() async {
    emit(HotelReviewLoading());
    try {
      final hotelReview = await _repository.fetchHotelReviews();
      emit(HotelReviewLoaded(hotelReview));
    } catch (error) {
      emit(HotelReviewError('Failed to fetch hotel reviews: $error'));
    }
  }
}
