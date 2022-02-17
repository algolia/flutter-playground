import 'package:flutter/material.dart';

class RatingDisplay extends StatelessWidget {
  const RatingDisplay({
    Key? key,
    this.value = 0,
    required this.reviewsCount,
    this.fontSize = 8,
    this.iconSize = 8,
    this.isExtended = false,
  }) : super(key: key);

  final int value;
  final int reviewsCount;
  final double fontSize;
  final double iconSize;
  final bool isExtended;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarDisplay(
          value: value,
          size: iconSize,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
              isExtended ? '($reviewsCount reviews)' : '($reviewsCount)',
              style: TextStyle(fontSize: fontSize)),
        )
      ],
    );
  }
}

class StarDisplay extends StatelessWidget {
  const StarDisplay({Key? key, this.value = 0, this.size = 8})
      : super(key: key);

  final int value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          size: size,
        );
      }),
    );
  }
}
