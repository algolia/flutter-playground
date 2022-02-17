import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_demo/ui/screens/home/home_screen.dart';
import 'package:flutter_ecom_demo/ui/theme_colors.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SWApp());
}

//
class SWApp extends StatelessWidget {
  const SWApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = ThemeColors.darkBlue;
    return MaterialApp(
      title: 'Spencer & Williams Fashion',
      theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: primaryColor))),
      home: const HomeScreen(),
    );
  }
}
