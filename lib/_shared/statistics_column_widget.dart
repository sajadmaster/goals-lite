import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class StatWidget extends StatefulWidget {
  String statDateType;
  Goal goal;
  double statValue;
  StatWidget(this.statDateType, this.goal, this.statValue, {Key? key}) : super(key: key);

  @override
  State<StatWidget> createState() => _StatWidgetState();
}

class _StatWidgetState extends State<StatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              widget.statValue.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black2),
            ),
            Text(
              widget.goal.getUnit,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: black2),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(widget.statDateType),
      ],
    );
  }
}
