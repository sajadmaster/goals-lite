import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/Record/add_data_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Widget ThreeVertDots(context) {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (value) {
        print('selected value $value');
        // Add Data
        if (value == 1) {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => AddDataPopup(),
          );
        } else if (value == 2) {
          print('sajad value 2');
          Goal.GetGoalList();
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
