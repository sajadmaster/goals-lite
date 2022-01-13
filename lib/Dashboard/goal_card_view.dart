import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_no_content_view.dart';
import 'package:goals_lite/Dashboard/dashboard_with_content_view.dart';
import 'package:goals_lite/_shared/statistics_column_widget.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/Dashboard/three_dot_dropdown.dart';
import 'package:goals_lite/_shared/statistics_controller.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  const GoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    goal.name,
                    style: const TextStyle(color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ThreeVertDots_goalCard(context, goal),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  // Stats(recordList).getTodayStats(),
                  // StatColumn(goal),
                  // const Spacer(),
                  // StatColumn(goal),
                  // const Spacer(),
                  // StatColumn(goal),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
