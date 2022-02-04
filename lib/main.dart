import 'package:flutter/material.dart';
import 'package:my_app/ui/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algolia & Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SearchScreen(title: 'Algolia & Flutter'),
    );
  }
}
