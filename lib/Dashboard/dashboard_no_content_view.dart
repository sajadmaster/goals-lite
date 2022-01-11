import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/create_goal_popup_view.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DashboardNoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Image(
                  image: AssetImage('assets/images/dashboard_empty_bg.png'),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(SET_GOAL_GET_STARTED, style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          RoundElevatedButton(
            buttonText: CREATE_GOAL,
            onPress: () {
              showBarModalBottomSheet(
                context: context,
                builder: (context) => CreateGoalPopUp(),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
