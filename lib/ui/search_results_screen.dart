import 'package:flutter/material.dart';
import 'package:flutter_ecom_demo/data/product_repository.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/ui/product_screen.dart';
import 'package:flutter_ecom_demo/ui/widgets/icon_label.dart';
import 'package:flutter_ecom_demo/ui/widgets/product_view.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  _SearchResultsScreen createState() => _SearchResultsScreen();
}

class _SearchResultsScreen extends State<SearchResultsScreen> {
  final _productRepository = ProductRepository();

  String get query => widget.query;

  List<Product> _hits = [];

  @override
  void initState() {
    super.initState();
    setupHits();
  }

  Future<void> setupHits() async {
    final results = await _productRepository.getProducts(query);
    setState(() {
      _hits = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/og.png', height: 128),
        actions: const [
          IconLabel(icon: Icons.pin_drop_outlined, text: 'STORES'),
          IconLabel(icon: Icons.person_outline, text: 'ACCOUNTS'),
          IconLabel(icon: Icons.shopping_bag_outlined, text: 'CART')
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: _hits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductView(
                      product: _hits[index],
                      imageAlignment: Alignment.bottomCenter,
                      onProductPressed: (objectID) {
                        presentProductPage(context, objectID);
                      });
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10))),
      ),
    );
  }

  void presentProductPage(BuildContext context, String productID) {
    _productRepository
        .getProduct(productID)
        .then((product) => Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return ProductScreen(product: product);
              },
            )));
  }
}
