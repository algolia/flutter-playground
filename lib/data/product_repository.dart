import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/domain/query.dart';

import 'algolia_client.dart';

class ProductRepository {
  final AlgoliaAPIClient client;

  ProductRepository(this.client);

  Future<List<Product>> getProducts(String query) async {
    var response = await client.search(Query(query));
    var hits = response['hits'] as List;
    return List<Product>.from(hits.map((hit) => Product.fromJson(hit)));
  }

  Future<List<Product>> getSeasonalProducts() async {
    var response = await client
        .search(Query('', ruleContexts: ['home-spring-summer-2021']));
    var hits = response['hits'] as List;
    return List<Product>.from(hits.map((hit) => Product.fromJson(hit)));
  }
}
