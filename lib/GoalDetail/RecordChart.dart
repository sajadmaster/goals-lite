import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:goals_lite/Record/record.dart';
import 'package:intl/intl.dart';
import 'package:goals_lite/_shared/my_classes.dart';

class RecordChart extends StatelessWidget {
  final List<charts.Series<WeekRecord, String>> seriesList;

  RecordChart(this.seriesList);

  factory RecordChart.showWeekData(List<Record> recordList) {
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

  static List<charts.Series<WeekRecord, String>> getWeekData(List<Record> recordList) {
    DateTime todayDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    // print('today is $todayDate');
    List<WeekRecord> weekRecord = [];
    List<double> valuesOfWeek = List.filled(7, 0);
    List<DateTime> daysOfWeek = List.filled(7, todayDate);

    // Generate days of week from Monday (1) to Sunday (7)
    // print('Week Days in daysOfWeek: ');
    for (int i = 1; i < 8; i++) {
      DateTime weekDay = todayDate.subtract(Duration(days: todayDate.weekday - i));
      daysOfWeek[i - 1] = weekDay;
      // print('${i - 1} and ${daysOfWeek[i - 1]}');
    }

    // print('recordList length is ${recordList.length}');
    // print('recordList length is ${recordList[0].getDateTime}');
    // print('records value:');

    // Loop through all records and filter them for the selected week
    Record tempRecord;
    for (int i = 1; i < recordList.length; i++) {
      tempRecord = recordList[i];
      // print('Record Date ${tempRecord.getDateTime} and record value ${tempRecord.getValue}');
      for (int i = 0; i < 7; i++) {
        if (DateOnlyCompareItem(tempRecord.getDateTime).isSameDate(daysOfWeek[i])) {
          // print('Matched date: ${tempRecord.getDateTime} Matched value: ${tempRecord.getDateTime} Matched i: $i');
          valuesOfWeek[i] += tempRecord.getValue;
          // print('New valuesOfWeek: ${valuesOfWeek[i]} i is $i');
        }
      }
    }

    // Weekrecord list: populate
    for (int i = 0; i < 7; i++) {
      // print('Weekrecord: i is: $i value is: ${valuesOfWeek[i]}');
      weekRecord.add(WeekRecord(DateFormat('EE').format(daysOfWeek[i]), valuesOfWeek[i].toInt()));
    }

    // print('Show empty chart while waiting for the data to load');
    return [
      charts.Series<WeekRecord, String>(
        id: 'Week',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (WeekRecord weekRecord, _) => weekRecord.week,
        measureFn: (WeekRecord weekRecord, _) => weekRecord.value,
        data: weekRecord,
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
