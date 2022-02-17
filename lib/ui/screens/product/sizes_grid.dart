import 'package:flutter/material.dart';
import 'package:flutter_ecom_demo/domain/product.dart';
import 'package:flutter_ecom_demo/ui/theme_colors.dart';

class SizesGrid extends StatelessWidget {
  const SizesGrid(
      {Key? key, required this.product, this.selectedSize, this.didSelectSize})
      : super(key: key);

  final Product product;
  final String? selectedSize;
  final Function(String)? didSelectSize;

  @override
  Widget build(BuildContext context) {
    final sizesCount = product.sizes?.length ?? 0;
    final rowsCount = sizesCount / 4 + (sizesCount % 4 == 0 ? 0 : 1);
    return SizedBox(
        height: rowsCount * 50,
        child: GridView.count(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 4,
            childAspectRatio: 4 / 2,
            children: List.generate(sizesCount, (index) {
              String size = product.sizes?[index] ?? "";
              bool isSelected = size == selectedSize;
              if (isSelected) {
                return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: ThemeColors.darkBlue),
                    onPressed: () => didSelectSize?.call(size),
                    child: Text(size));
              } else {
                return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: ThemeColors.darkBlue,
                      side: const BorderSide(
                          width: 1.0,
                          color: ThemeColors.darkBlue,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () => didSelectSize?.call(size),
                    child: Text(size));
              }
            })));
  }
}
