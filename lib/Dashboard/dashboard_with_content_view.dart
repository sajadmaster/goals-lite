import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/goal_card_view.dart';
import 'package:goals_lite/Goal/create_goal_popup_view.dart';
import 'package:goals_lite/GoalDetail/goal_detail_main_view.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DashboardWithContent extends StatefulWidget {
  final Iterable<Goal> goalsList;

  const DashboardWithContent(this.goalsList, {Key? key}) : super(key: key);

  @override
  _DashboardWithContentState createState() => _DashboardWithContentState();
}

class _DashboardWithContentState extends State<DashboardWithContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            GOALS,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: black2),
          ),
          SizedBox(height: 9),
          Expanded(
            // Goal Card ListView
            child: ListView.builder(
                itemCount: widget.goalsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Goal Card
                    child: GoalCard(
                      goal: widget.goalsList.elementAt(index),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoalDetail(widget.goalsList.elementAt(index))),
                      );
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            // Create Goal Button
            child: RoundElevatedButton(
              buttonText: CREATE_GOAL,
              onPress: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => CreateGoalPopUp(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
