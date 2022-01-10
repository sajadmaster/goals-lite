import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/goal_card_view.dart';
import 'package:goals_lite/Goal/create_goal_view.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DashboardWithContent extends StatefulWidget {
  final List<Goal> goalsList;

  DashboardWithContent(this.goalsList);

  @override
  _DashboardWithContentState createState() => _DashboardWithContentState();
}

class _DashboardWithContentState extends State<DashboardWithContent> {
  @override
  void initState() {
    for (int i = 0; i < widget.goalsList.length; i++) {
      // String temp = widget.goalsList[i].getGoalName;
      // print('Sajad Goal Name: $temp');
    }
    super.initState();
  }

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
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: black2),
          ),
          SizedBox(height: 9),
          Expanded(
            child: ListView.builder(
                itemCount: widget.goalsList.length,
                itemBuilder: (context, index) {
                  return GoalCard(goal: widget.goalsList[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
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
