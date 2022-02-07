import 'package:flutter/material.dart';
import 'package:my_app/ui/home.dart';

void main() {
  runApp(SWApp());
}

class SWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFF21243D);
    return MaterialApp(
      title: 'Spencer & Williams Fashion',
      theme: ThemeData(
          primaryColor: primaryColor,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
            //toolbarTextStyle: TextStyle(color: primaryColor)
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: primaryColor))),
      home: HomeScreen(),
    );
  }
}
