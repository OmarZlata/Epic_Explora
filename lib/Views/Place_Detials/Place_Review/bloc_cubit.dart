import 'package:bloc/bloc.dart';
import 'api_request.dart';
import 'bloc_states.dart';
import 'get_review_model.dart';

enum ReviewEvent {fetchReviews}

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewService _reviewService;

  ReviewCubit(this._reviewService) : super(ReviewInitial());

  Future<void> fetchReviews() async {
    emit(ReviewLoading());
    try {
      GetReviews reviews = await _reviewService.fetchReviews();
      emit(ReviewLoaded(reviews));
    } catch (error) {
      emit(ReviewError('Failed to fetch reviews: $error'));
    }
  }
}
