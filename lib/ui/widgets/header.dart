import 'package:flutter/material.dart';

import 'icon_label.dart';

AppBar swAppBar({PreferredSizeWidget? bottom}) {
  return AppBar(
    titleSpacing: 0,
    automaticallyImplyLeading: false,
    title: Image.asset('assets/images/og.png', height: 128),
    actions: const [
      IconLabel(icon: Icons.pin_drop_outlined, text: 'STORES'),
      IconLabel(icon: Icons.person_outline, text: 'ACCOUNTS'),
      IconLabel(icon: Icons.shopping_bag_outlined, text: 'CART')
    ],
    bottom: bottom,
  );
}
