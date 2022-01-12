import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class StatColumn extends StatelessWidget {
  Goal goal;
  StatColumn(this.goal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Text(
              '8.5',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: black2),
            ),
            Text(
              goal.getUnit,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, color: black2),
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text('Today'),
      ],
    );
  }
}
