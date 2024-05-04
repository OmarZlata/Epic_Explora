class HotelReview {
  final bool success;
  final String message;
  final HotelReviewData data;
  final Map<String, dynamic> errors;

  HotelReview({
    required this.success,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory HotelReview.fromJson(Map<String, dynamic> json) {
    return HotelReview(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      data: HotelReviewData.fromJson(json['data'] ?? {}),
      errors: json['errors'] ?? {},
    );
  }
}

class HotelReviewData {
  final Map<String, dynamic> avgRating;
  final List<UserReview> userReviews;

  HotelReviewData({
    required this.avgRating,
    required this.userReviews,
  });

  factory HotelReviewData.fromJson(Map<String, dynamic> json) {
    return HotelReviewData(
      avgRating: json['avg_rating'] ?? {},
      userReviews: (json['userReviews'] as List<dynamic>?)
          ?.map((review) => UserReview.fromJson(review))
          .toList() ??
          [],
    );
  }
}

class UserReview {
  final String userName;
  final List<Review> userReviews;

  UserReview({
    required this.userName,
    required this.userReviews,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      userName: json['user_name'] ?? "",
      userReviews: (json['user_reviews'] as List<dynamic>?)
          ?.map((review) => Review.fromJson(review))
          .toList() ??
          [],
    );
  }
}

class Review {
  final int starRating;
  final String comments;

  Review({
    required this.starRating,
    required this.comments,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      starRating: json['star_rating'] ?? 0,
      comments: json['comments'] ?? "",
    );
  }
}
