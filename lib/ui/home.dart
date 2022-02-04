import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/og.png'),
          actions: [
            IconLabel(Icons.pin_drop_outlined, 'STORES'),
            IconLabel(Icons.person_outline, 'ACCOUNTS'),
            IconLabel(Icons.shopping_bag_outlined, 'CART')
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Row(
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [Icon(Icons.menu), Text("Menu")],
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(child: Center(child: Text("Hello world"))));
  }

  Column IconLabel(IconData? icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(text),
        ),
      ],
    );
  }
}
