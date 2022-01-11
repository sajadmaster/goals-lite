import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class RecordColumn extends StatelessWidget {
  Goal goal;
  RecordColumn(this.goal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '8.5',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black2),
            ),
            Text(
              goal.getUnit,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: black2),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text('Today'),
      ],
    );
  }
}
