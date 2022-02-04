class SearchHit {
  final String name;
  final String image;

  SearchHit(this.name, this.image);

  static SearchHit fromJson(Map<String, dynamic> json) {
    return SearchHit(json['name'], json['image_urls'][0]);
  }
}
