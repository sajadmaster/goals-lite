import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_classes.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/models/goal.dart';

class StatWidget extends StatelessWidget {
  final String statDateType;
  final Goal goal;
  final double statValue;
  final bool isGoalUnitVisible;
  const StatWidget(
      {required this.statDateType, required this.statValue, required this.goal, required this.isGoalUnitVisible});

  @override
  Widget build(BuildContext context) {
    String tempGoalUnit = goal.getUnit;
    if (!isGoalUnitVisible) tempGoalUnit = '';

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              removeDecimalZeroFormat(statValue),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black2),
            ),
            Text(
              tempGoalUnit,
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

  final Iterable<double> statValueList;
  final Goal goal;
  const StatWidgetRow(this.statTitleList, this.statValueList, this.goal);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StatWidget(
          statDateType: statTitleList[0], statValue: statValueList.elementAt(0), goal: goal, isGoalUnitVisible: false),
      Spacer(),
      StatWidget(
          statDateType: statTitleList[1], statValue: statValueList.elementAt(1), goal: goal, isGoalUnitVisible: false),
      Spacer(),
      StatWidget(
          statDateType: statTitleList[2], statValue: statValueList.elementAt(2), goal: goal, isGoalUnitVisible: false),
    ]);
  }
}
