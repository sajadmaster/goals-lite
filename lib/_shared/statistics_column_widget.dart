import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class StatWidget extends StatelessWidget {
  final String statDateType;
  final Goal goal;
  final double statValue;
  const StatWidget(this.statDateType, this.statValue, this.goal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              statValue.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black2),
            ),
            Text(
              goal.getUnit,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: black2),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(statDateType),
      ],
    );
  }
}

class StatWidgetRow extends StatelessWidget {
  final List<String> statTitleList;

  final List<double> statValueList;
  final Goal goal;
  const StatWidgetRow(this.statTitleList, this.statValueList, this.goal);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StatWidget(statTitleList[0], statValueList[0], goal),
      Spacer(),
      StatWidget(statTitleList[1], statValueList[1], goal),
      Spacer(),
      StatWidget(statTitleList[2], statValueList[2], goal),
    ]);
  }
}
