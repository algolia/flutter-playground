import 'package:flutter/material.dart';
import 'package:my_app/ui/home.dart';

void main() {
  runApp(SWApp());
}

class SWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spencer & Williams Fashion',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
      ),
      home: HomeScreen(),
    );
  }
}
