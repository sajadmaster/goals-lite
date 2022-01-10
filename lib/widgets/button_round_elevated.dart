import 'package:flutter/material.dart';

class RoundElevatedButton extends StatelessWidget {
  String buttonText;
  VoidCallback onPress;

  RoundElevatedButton({required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))));
  }
}
