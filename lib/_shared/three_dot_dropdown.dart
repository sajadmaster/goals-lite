import 'package:flutter/material.dart';
import 'package:goals_lite/Record/add_data_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
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
        }
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                "Add Data",
                style: TextStyle(color: black2),
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text(
                "Delete Goal",
                style: TextStyle(color: red4),
              ),
              value: 2,
            )
          ]);
}
