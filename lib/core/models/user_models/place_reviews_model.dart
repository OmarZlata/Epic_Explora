class UserReview {
  final int userId;
  final String userName;
  final List<Review> userReviews;

  UserReview({
    required this.userId,
    required this.userName,
    required this.userReviews,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      userId: json['user_id'],
      userName: json['user_name'],
      userReviews: (json['user_reviews'] as List<dynamic>)
          .map((review) => Review.fromJson(review))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_reviews': userReviews.map((review) => review.toJson()).toList(),
    };
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
      starRating: json['star_rating'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'star_rating': starRating,
      'comments': comments,
    };
  }
}
