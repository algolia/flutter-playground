import 'package:flutter/material.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/ui/screens/home/section_header.dart';
import 'package:flutter_ecom_demo/ui/widgets/product_card_view.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    Key? key,
    required this.title,
    required this.items,
    this.onTap,
    this.imageAlignment = Alignment.bottomCenter,
  }) : super(key: key);

  final String title;
  final List<Product> items;
  final ValueChanged<String>? onTap;
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 200.0,
            child: ListView.separated(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCardView(
                      product: items[index],
                      imageAlignment: imageAlignment,
                      onTap: (objectID) => onTap?.call(objectID));
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10)))
      ],
    );
  }
}
