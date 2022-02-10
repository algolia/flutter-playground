class Reviews {
  final num? rating;
  final num? count;

  Reviews({this.rating, this.count});

  static Reviews fromJson(Map<String, dynamic> json) {
    return Reviews(rating: json['rating'], count: json['count']);
  }
}
