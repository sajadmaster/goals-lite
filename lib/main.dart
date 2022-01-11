import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            headline2: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, color: black2),
            button: TextStyle(fontSize: 16.0, color: black2),
          ),
        ),
        home: SplashScreen());
  }
}
