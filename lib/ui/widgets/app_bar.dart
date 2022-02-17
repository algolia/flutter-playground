import 'package:flutter/material.dart';

/// S&W custom top app bar.
class SWAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SWAppBar({Key? key, this.bottom}) : super(key: key);

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

class IconLabel extends StatelessWidget {
  const IconLabel({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(icon),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(text, style: Theme.of(context).textTheme.caption),
          ),
        ],
      ),
    );
  }
}
