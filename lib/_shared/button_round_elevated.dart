import 'package:flutter/material.dart';

class RoundElevatedButton extends StatelessWidget {
  String buttonText;
  Function onPress;

  RoundElevatedButton(this.buttonText, this.onPress);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress(),
        child: Text(
          buttonText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))));
  }
}
