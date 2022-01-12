import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:goals_lite/Record/record.dart';

class RecordChart extends StatelessWidget {
  final List<charts.Series<WeekRecord, String>> seriesList;

  RecordChart(this.seriesList);

  factory RecordChart.showWeekData(Future<List<Record>> recordList) {
    return RecordChart(
      getWeekData(recordList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
    );
  }

  static List<charts.Series<WeekRecord, String>> getWeekData(Future<List<Record>> recordList) {
    final data = [
      WeekRecord('Mon', 5),
      WeekRecord('Tue', 25),
      WeekRecord('Wed', 80),
      WeekRecord('Thu', 75),
      WeekRecord('Fri', 0),
      WeekRecord('Sat', 0),
      WeekRecord('Sun', 0),
    ];

    DateTime todayDate = DateTime.now();
    print('today is $todayDate');
    DateTime _1weekDate = todayDate.subtract(Duration(days: 7)); // 1 week ago
    print('_1weekDate is $_1weekDate');

    recordList.catchError(
      (onError) {
        print("sajad called when there is an error catches error");
      },
    ).then((recordList) {
      for (Record record in recordList) {
        if (_1weekDate.isBefore(record.getDateTime)) {
          print('sajad date is inside 1 week ago: ${record.getDateTime}');
          print(record.getValue);
          print(record.getID);
        }
      }

      Record findRecord(DateTime dateTime) =>
          recordList.firstWhere((record) => record.getDateTime == DateTime.now().year);
      print("called with value = getGoalID " + recordList.first.getGoalID);
    });

    // recordList.catchError(
    //   (onError) {
    //     print("sajad called when there is an error catches error");
    //   },
    // ).then((recordList) {
    //   recordList.where((record) {
    //     print("called with value = getGoalID " + recordList.first.getGoalID);

    //     if (_1weekDate.isBefore(record.getDateTime)) {
    //       print('Found a record: ${record.getDateTime}');
    //     } else {
    //       print('Skipped a record: ${record.getDateTime}');
    //     }
    //     return false;
    //   });
    // });

    return [
      charts.Series<WeekRecord, String>(
        id: 'Week',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (WeekRecord weekRecord, _) => weekRecord.week,
        measureFn: (WeekRecord weekRecord, _) => weekRecord.value,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class WeekRecord {
  final String week;
  final int value;

  WeekRecord(this.week, this.value);
}


      // Record findRecord(DateTime dateTime) => recordList
      //     .firstWhere((record) => record.getDateTime == DateTime.now().year);

      // print("called with value = getGoalID " + recordList.first.getGoalID);
      // print("called with value = getID " + recordList.first.getID);
      // print("called with value = getValue " + recordList.first.getValue.toString());