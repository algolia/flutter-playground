import 'package:flutter/cupertino.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/ui/widgets/product_item_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedHitsList extends StatelessWidget {
  const PagedHitsList(
      {Key? key, required this.pagingController, this.onHitClick})
      : super(key: key);

  final PagingController<int, Product> pagingController;
  final ValueSetter<String>? onHitClick;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Product>.separated(
      shrinkWrap: true,
      pagingController: pagingController,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, item, index) => ProductItemView(
            product: item,
            imageAlignment: Alignment.bottomCenter,
            onProductPressed: (objectID) => onHitClick?.call(objectID)),
      ),
    );
  }
}
