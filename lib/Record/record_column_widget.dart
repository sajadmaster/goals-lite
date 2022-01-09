import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class RecordColumn extends StatelessWidget {
  RecordColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '8.5',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: black2),
        ),
        SizedBox(height: 2),
        Text('Today (km)'),
      ],
    );
  }
}
