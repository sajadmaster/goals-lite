import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/Signin/signin_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    super.initState();
  }
}
