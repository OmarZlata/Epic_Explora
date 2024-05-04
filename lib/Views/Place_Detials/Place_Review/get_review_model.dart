class GetReviews {
  late bool success;
  late String message;
  late ReviewsData data;
  late Errors errors;

  GetReviews({
    required this.success,
    required this.message,
    required this.data,
    required this.errors,
  });

  GetReviews.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = ReviewsData.fromJson(json['data']);
    errors = Errors.fromJson(json['errors']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data.toJson();
    data['errors'] = errors.toJson();
    return data;
  }
}

class ReviewsData {
  late AvgRating avgRating;
  late List<UserReview> userReviews;

  ReviewsData({
    required this.avgRating,
    required this.userReviews,
  });

  ReviewsData.fromJson(Map<String, dynamic> json) {
    avgRating = AvgRating.fromJson(json['avg_rating']);
    userReviews = List<UserReview>.from(
      json['userReviews'].map((review) => UserReview.fromJson(review)),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['avg_rating'] = avgRating.toJson();
    data['userReviews'] = userReviews.map((review) => review.toJson()).toList();
    return data;
  }
}

class AvgRating {
  late int placeRate;

  AvgRating({required this.placeRate});

  AvgRating.fromJson(Map<String, dynamic> json) {
    placeRate = json['place rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['place rate'] = placeRate;
    return data;
  }
}

class UserReview {
  late String userName;
  late List<Review> userReviews;

  UserReview({
    required this.userName,
    required this.userReviews,
  });

  UserReview.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userReviews = List<Review>.from(
      json['user_reviews'].map((review) => Review.fromJson(review)),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_name'] = userName;
    data['user_reviews'] = userReviews.map((review) => review.toJson()).toList();
    return data;
  }
}

class Review {
  late int starRating;
  late String comments;

  Review({
    required this.starRating,
    required this.comments,
  });

  Review.fromJson(Map<String, dynamic> json) {
    starRating = json['star_rating'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['star_rating'] = starRating;
    data['comments'] = comments;
    return data;
  }
}

class Errors {
  Errors();

  Errors.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    return data;
  }
}
