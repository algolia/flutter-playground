import 'package:my_app/domain/price.dart';
import 'package:my_app/domain/reviews.dart';

class Product {
  final String? objectID;
  final String? name;
  final String? brand;
  final String? image;
  final Price? price;
  final Reviews? reviews;

  Product(
      {this.objectID,
      this.name,
      this.image,
      this.brand,
      this.price,
      this.reviews});

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        objectID: json['objectID'],
        name: json['name'],
        image: json['image_urls'][0],
        brand: json['brand'],
        price: Price.fromJson(json['price']),
        reviews: Reviews.fromJson(json['reviews']));
  }

  @override
  String toString() {
    return 'Product{objectID: $objectID, name: $name, brand: $brand, image: $image, price: $price, reviews: $reviews}';
  }
}
