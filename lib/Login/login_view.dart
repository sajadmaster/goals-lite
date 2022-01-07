import 'package:flutter/material.dart';
import 'login_button/login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        // background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Bottom Login Container
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
              height: 279,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome to Goals!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 40),
                  LoginButtonWidget('Apple'),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
