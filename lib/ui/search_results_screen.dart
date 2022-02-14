import 'package:flutter/material.dart';
import 'package:flutter_ecom_demo/data/product_repository.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/domain/query.dart';
import 'package:flutter_ecom_demo/ui/product_screen.dart';
import 'package:flutter_ecom_demo/ui/widgets/icon_label.dart';
import 'package:flutter_ecom_demo/ui/widgets/product_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key, required this.query}) : super(key: key);

  final Query query;

  @override
  _SearchResultsScreen createState() => _SearchResultsScreen();
}

class _SearchResultsScreen extends State<SearchResultsScreen> {
  final _productRepository = ProductRepository();

  Query get query => widget.query;

  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    query.page = pageKey;
    try {
      final response = await _productRepository.searchProducts(query);
      final hits = response.hits ?? List.empty();
      final isLastPage = response.page == response.nbPages;
      final nextPageKey = isLastPage ? null : pageKey + 1;
      _pagingController.appendPage(hits, nextPageKey);
    } catch (error) {
      _pagingController.error = error;
    }
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
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedGridView<int, Product>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, item, index) => ProductView(
                product: item,
                imageAlignment: Alignment.bottomCenter,
                onProductPressed: (objectID) {
                  presentProductPage(context, objectID);
                }),
          ),
        ),
      )),
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
