import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom_demo/model/product.dart';

class FirebaseClient {
  FirebaseClient._internal();

  static final FirebaseClient _instance = FirebaseClient._internal();

  factory FirebaseClient() {
    return _instance;
  }

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<Product> get(String productID) async {
    final snapshot = await products.doc(productID).get();
    return Product.fromJson(snapshot.data() as Map<String, dynamic>);
  }
}
