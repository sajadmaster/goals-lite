import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/Record/add_record_popup_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';

class GoalDetail extends StatefulWidget {
  GoalDetail(this.goal);
  final Goal goal;

  @override
  _GoalDetailState createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      titleSpacing: 0.0,
      title: Text(
        widget.goal.getName,
        style: TextStyle(color: blue2, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {
            AddRecordPopup(goal: widget.goal);
          },
          child: Text(
            ADD_RECORD,
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(width: 10),
      ],
    ));
  }
}
