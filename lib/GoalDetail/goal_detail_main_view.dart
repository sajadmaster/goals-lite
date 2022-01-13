import 'package:flutter/material.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/GoalDetail/RecordCard_view.dart';
import 'package:goals_lite/GoalDetail/RecordChart.dart';
import 'package:goals_lite/Record/add_record_popup_view.dart';
import 'package:goals_lite/Record/record.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GoalDetail extends StatefulWidget {
  final Goal goal;
  GoalDetail(this.goal);

  @override
  _GoalDetailState createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        title: Text(
          widget.goal.getName,
          style: const TextStyle(color: blue2, fontWeight: FontWeight.bold),
        ),
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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: FutureBuilder(
                future: Record.getRecordList(widget.goal),
                builder: (context, AsyncSnapshot<List<Record>> rl) {
                  if (!rl.hasData) {
                    return Center(child: Text('Loading data...'));
                  } else {
                    return Column(
                      children: [
                        Text('Chart'),
                        Expanded(child: RecordChart.showWeekData(rl)),
                        Text('data'),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: rl.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (rl.hasData) {
                                  return RecordCard(record: rl.data![index], goalUnit: widget.goal.getUnit);
                                } else {
                                  return Text('Error in record data');
                                }
                              }),
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
