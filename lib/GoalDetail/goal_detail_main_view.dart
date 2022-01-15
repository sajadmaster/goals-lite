import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/GoalDetail/RecordCard_view.dart';
import 'package:goals_lite/GoalDetail/Chart/Chart_controller.dart';
import 'package:goals_lite/Record/add_record_popup_view.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/models/record.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:goals_lite/_shared/statistics_column_widget.dart';
import 'package:goals_lite/_shared/statistics_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'Chart/ChartTabbar_view.dart';

class GoalDetail extends StatefulWidget {
  final Goal goal;
  GoalDetail(this.goal);

  @override
  _GoalDetailState createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  @override
  Widget build(BuildContext context) {
    final Future<Iterable<Record>> recordListFuture = Record.getRecordList(widget.goal);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, widget),
      // ######### body
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: FutureBuilder(
                future: recordListFuture,
                builder: (context, AsyncSnapshot<Iterable<Record>> rl) {
                  if (!rl.hasData) {
                    return const Center(child: Text(LOADING_DATA));
                  } else {
                    Iterable<Record>? recordList = rl.data;
                    Iterable<double> statValuesList = Stats(recordList!).getTodayStatsWidget();

                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        // Statistics
                        const Text(
                          '  ' + STATISTICS,
                          style: TextStyle(color: black2),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: StatWidgetRow(STAT_TITLE_LIST, statValuesList, widget.goal),
                        ),
                        const SizedBox(height: 25),
                        const SizedBox(
                          width: double.infinity,
                          height: 10,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: black0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Chart Tabbar
                        ChartTabbar(),
                        const SizedBox(height: 10),
                        // Chart
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: RecordChart.showWeekData(recordList),
                          ),
                          flex: 3,
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 7,
                          child: Container(
                            color: black0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                              child: Column(
                                children: [
                                  const Text(
                                    DATA,
                                    style: TextStyle(color: black2),
                                  ),
                                  // Data
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: recordList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return RecordCard(record: recordList.elementAt(index), goal: widget.goal);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

// ######### Appbar
PreferredSizeWidget appbar(context, GoalDetail widget) {
  return AppBar(
    // Appbar: Back button
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => DashboardPage(),
            transitionDuration: Duration.zero,
          ),
        )
      },
    ),
    // Appbar: Title text
    title: Text(
      widget.goal.getName,
      style: const TextStyle(color: blue2, fontWeight: FontWeight.bold),
    ),
    // Appbar: Add Record button
    actions: [
      TextButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => AddRecordPopup(
              goal: widget.goal,
            ),
          );
        },
        child: const Text(
          ADD_RECORD,
          style: TextStyle(fontSize: 14),
        ),
      ),
      const SizedBox(width: 10),
    ],
    // Appbar: bottom line
    bottom: PreferredSize(
        child: Container(
          color: black1,
          height: 0.5,
        ),
        preferredSize: const Size.fromHeight(4.0)),
    // Appbar: extra
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    titleSpacing: 0.0,
  );
}
