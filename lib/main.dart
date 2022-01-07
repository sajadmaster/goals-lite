import 'package:flutter/material.dart';
import 'Signin/signin_view.dart';
import 'my_colors.dart';

void main() {
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
      home: SigninPage(),
    );
  }
}
