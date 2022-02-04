import 'package:flutter/material.dart';
import 'package:my_app/ui/home.dart';
import 'package:my_app/ui/search.dart';

void main() {
  runApp(SWApp());
}

class SWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spencer & Williams Fashion',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
