import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/goal_card_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class DashboardWithContent extends StatefulWidget {
  const DashboardWithContent({Key? key}) : super(key: key);

  @override
  _DashboardWithContentState createState() => _DashboardWithContentState();
}

class _DashboardWithContentState extends State<DashboardWithContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Goals',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: black2),
          ),
          SizedBox(height: 9),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                GoalCard(),
                GoalCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
