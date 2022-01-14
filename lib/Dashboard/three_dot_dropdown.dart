import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/Record/add_record_popup_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'goal_delete_alert.dart';

Widget ThreeVertDots_goalCard(context, Goal goal) {
  return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) async {
        // Add Data
        if (value == 1) {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => AddRecordPopup(
              goal: goal,
            ),
          );
        }
        // delete goal
        else if (value == 2) {
          bool? isDeleteGoal = await DeleteGoalAlert(context);
          if (isDeleteGoal!) {
            String response = await Goal.deleteFirebase(goal);
            if (response == FAILED_DELETE_GOAL) {
              print(FAILED_DELETE_GOAL);
            } else if (response == SUCCESS) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const DashboardPage(),
                  transitionDuration: Duration.zero,
                ),
              );
            }
          }
        }
      },
      itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text(
                ADD_RECORD,
                style: TextStyle(color: black2),
              ),
              value: 1,
            ),
            const PopupMenuItem(
              child: Text(
                DELETE_GOAL,
                style: TextStyle(color: red4),
              ),
              value: 2,
            )
          ]);
}
