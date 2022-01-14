import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/GoalDetail/goal_detail_main_view.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/models/record.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';

Widget ThreeDots_recordCard(context, Record record, Goal goal) {
  return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) async {
        // delete record
        if (value == 1) {
          await Record.deleteRecord(record);
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => GoalDetail(goal),
              transitionDuration: Duration.zero,
            ),
          );
        }
      },
      itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text(
                DELETE_RECORD,
                style: TextStyle(color: red4),
              ),
              value: 1,
            )
          ]);
}
