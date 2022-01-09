import 'package:flutter/material.dart';
import 'package:goals_lite/Record/record_column_widget.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/three_dot_dropdown.dart';

class GoalCard extends StatelessWidget {
  const GoalCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    'Run',
                    style: TextStyle(
                        color: black2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ThreeVertDots(context),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  RecordColumn(),
                  Spacer(),
                  RecordColumn(),
                  Spacer(),
                  RecordColumn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
