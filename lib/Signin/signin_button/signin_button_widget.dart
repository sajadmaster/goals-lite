import 'package:flutter/material.dart';
import 'package:goals_lite/Signin/signin_button/signin_controller.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class SigninButtonWidget extends StatelessWidget {
  final String loginProvider;
  SignIn signin = SignIn();

  TextStyle textStyle = const TextStyle(fontSize: 16);

  // ignore: use_key_in_widget_constructors
  SigninButtonWidget(this.loginProvider);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: black3),
      onPressed: () => {signin.onPressAppleButton(context)},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Apple/Google Logo
            const Image(
              width: 16,
              image: AssetImage('assets/logos/apple_logo.png'),
            ),
            const SizedBox(width: 5),

            // Sign in text
            Text(
              'Sign in with $loginProvider',
              style: textStyle,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
