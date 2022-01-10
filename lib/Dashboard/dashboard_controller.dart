import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_no_content_view.dart';
import 'package:goals_lite/Dashboard/dashboard_with_content_view.dart';
import 'package:goals_lite/Goal/goal.dart';

class DoashboardBody extends StatefulWidget {
  @override
  _DoashboardBodyState createState() => _DoashboardBodyState();
}

class _DoashboardBodyState extends State<DoashboardBody> {
  final Future<List<Goal>> goalsListFuture = Goal.getGoalsList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Goal>>(
        future: goalsListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Goal>> gl) {
          if (gl.hasData) {
            List<Goal>? goalsList = gl.data;
            if (goalsList != null && goalsList.isNotEmpty) {
              print('goalsList length is ${goalsList.length}');
              return DashboardWithContent(goalsList);
            } else {
              return DashboardNoContent();
            }
          } else if (gl.hasError) {
            // return DashboardNoContent();
            print('Sajad hasError: ${gl.error}');
            return Text('${gl.error}');
          }
          return Container(); // before loading the results, show empty white container
        },
      ),
    );
  }
}
