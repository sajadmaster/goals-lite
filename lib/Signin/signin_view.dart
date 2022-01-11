import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'signin_button/signin_button_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
                    WELIME_TO_GOALS_LITE,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 40),
                  SigninButtonWidget('Apple'),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
