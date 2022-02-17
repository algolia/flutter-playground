import 'package:flutter/cupertino.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/ui/widgets/product_card_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedHitsGrid extends StatelessWidget {
  const PagedHitsGrid(
      {Key? key, required this.pagingController, this.onHitClick})
      : super(key: key);

  final PagingController<int, Product> pagingController;
  final Function(String)? onHitClick;

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Product>(
      shrinkWrap: true,
      pagingController: pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, item, index) => ProductCardView(
            product: item,
            imageAlignment: Alignment.bottomCenter,
            onTap: (objectID) => onHitClick?.call(objectID)),
      ),
    );
  }
}
