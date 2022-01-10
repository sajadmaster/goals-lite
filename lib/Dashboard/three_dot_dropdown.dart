import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_with_content_view.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/Record/add_data_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Widget ThreeVertDots(context, goal) {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (value) async {
        print('selected value $value');
        // Add Data
        if (value == 1) {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => AddDataPopup(),
          );
        } else if (value == 2) {
          print('sajad value 2');
          String response = await Goal.delete(goal);
          if (response == FAILED_DELETE_GOAL) {
            print(FAILED_DELETE_GOAL);
          } else if (response == SUCCESS) {
            print('Goal deleted successfully.');
          }
        }
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                ADD_DATA,
                style: TextStyle(color: black2),
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text(
                DELETE_GOAL,
                style: TextStyle(color: red4),
              ),
              value: 2,
            )
          ]);
}