
import 'get_review_model.dart';

abstract class ReviewState {
  const ReviewState();
}
class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final GetReviews reviews;

  ReviewLoaded(this.reviews);
}

class ReviewError extends ReviewState {
  final String message;
  ReviewError(this.message);
}
