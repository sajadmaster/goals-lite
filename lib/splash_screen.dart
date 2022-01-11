import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/Signin/signin_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() => isUserSignedin(context));
    // Firebase.initializeApp().whenComplete(() => _signOut().whenComplete(() => isUserSignedin(context)));
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

void isUserSignedin(context) {
  // Check if user is singed in or not
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('Sajad: User is currently signed out!');

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SigninPage(),
          transitionDuration: Duration.zero,
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => DashboardPage(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  });
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
