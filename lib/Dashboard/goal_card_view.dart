import 'package:flutter/material.dart';
import 'package:goals_lite/Record/record.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:goals_lite/_shared/statistics_column_widget.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/Dashboard/three_dot_dropdown.dart';
import 'package:goals_lite/_shared/statistics_controller.dart';

class GoalCard extends StatefulWidget {
  final Goal goal;
  GoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  late Future<List<Record>> recordsListFuture;
  @override
  void initState() {
    recordsListFuture = Record.getRecordList(widget.goal); // WARNING: MAYBE HIGH NETWORK USAGE
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.goal.name,
                    style: const TextStyle(color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ThreeVertDots_goalCard(context, widget.goal),
                ],
              ),
            ),
            const Spacer(),
            // Statistics: Today, Month, Total
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: FutureBuilder<List<Record>>(
                  future: recordsListFuture,
                  builder: (BuildContext context, AsyncSnapshot<List<Record>> rl) {
                    if (rl.hasData) {
                      List<Record>? recordsList = rl.data;
                      List<double> statValuesList = Stats(recordsList!).getTodayStatsWidget();
                      return StatWidgetRow(STAT_TITLE_LIST, statValuesList, widget.goal);
                    } else if (rl.hasError) {
                      print('Sajad hasError: ${rl.error}');
                      return Text('${rl.error}');
                    }
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
