import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Image.asset('assets/images/og.png', height: 128),
          actions: [
            IconLabel(Icons.pin_drop_outlined, 'STORES'),
            IconLabel(Icons.person_outline, 'ACCOUNTS'),
            IconLabel(Icons.shopping_bag_outlined, 'CART')
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.5)),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.menu),
                              label: const Text("MENU")),
                        ),
                        VerticalDivider(
                            width: 20,
                            indent: 12,
                            endIndent: 12,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.5)),
                        Flexible(
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("TBD"),
                              ));
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.search),
                                hintText:
                                    "Search products, articles, faq, ..."),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.33), BlendMode.srcOver),
                    child: Image.asset(
                      'assets/images/banner.jpg',
                      height: 128,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NEW\nCOLLECTION',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                      Text('SPRING/SUMMER 2022',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ],
        )));
  }

  Widget IconLabel(IconData? icon, String text) {
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
