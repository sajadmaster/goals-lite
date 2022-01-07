import 'package:flutter/material.dart';
import 'package:goals_lite/Signin/signin_button/signin_controller.dart';
import 'package:goals_lite/my_colors.dart';

class SigninButtonWidget extends StatelessWidget {
  final String loginProvider;
  SignIn signin = SignIn();

  TextStyle textStyle = TextStyle(fontSize: 16);

  // ignore: use_key_in_widget_constructors
  SigninButtonWidget(this.loginProvider);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: black3),
      onPressed: () => {
        signin.onPressAppleButton(onResult: (st, err) {
          // if(st){
          //   _controller.pushToApp();
          // }
        })
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DashboardPage()),
        // )
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Apple/Google Logo
            const Image(
              width: 16,
              image: AssetImage('assets/logos/apple_logo.png'),
            ),
            SizedBox(width: 5),

            // Sign in text
            Text(
              'Sign in with $loginProvider',
              style: textStyle,
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
