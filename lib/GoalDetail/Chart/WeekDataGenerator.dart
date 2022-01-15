import 'package:goals_lite/GoalDetail/Chart/Chart_controller.dart';
import 'package:goals_lite/_shared/my_classes.dart';
import 'package:goals_lite/models/record.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

List<charts.Series<ChartDataModel, DateTime>> WeekDataGenerator(Iterable<Record> recordList) {
  DateTime todayDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int weekLength = 7;

  // print('today is $todayDate');
  List<ChartDataModel> weekRecord = [];
  List<double> valuesOfWeek = List.filled(weekLength, 0);
  List<DateTime> daysOfWeek = List.filled(weekLength, todayDate);

  // Generate days of week from Monday (1) to Sunday (7)
  // print('Week Days in daysOfWeek: ');
  for (int i = 1; i < weekLength + 1; i++) {
    DateTime weekDay = todayDate.subtract(Duration(days: todayDate.weekday - i));
    daysOfWeek[i - 1] = weekDay;
    // print('${i - 1} and ${daysOfWeek[i - 1]}');
  }

  // print('recordList length is ${recordList.length}');
  // print('recordList length is ${recordList[0].getDateTime}');
  // print('records value:');
  // Loop through all records and filter them for the selected week
  Record tempRecord;
  for (int i = 0; i < recordList.length; i++) {
    tempRecord = recordList.elementAt(i);
    // print('Record Date ${tempRecord.getDateTime} and record value ${tempRecord.getValue}');
    for (int i = 0; i < weekLength; i++) {
      if (DateOnlyCompareItem(tempRecord.getDateTime).isSameDate(daysOfWeek[i])) {
        // print('Matched date: ${tempRecord.getDateTime} Matched value: ${tempRecord.getDateTime} Matched i: $i');
        valuesOfWeek[i] += tempRecord.getValue;
        // print('New valuesOfWeek: ${valuesOfWeek[i]} i is $i');
      }
    }
  }

  // Weekrecord list: populate
  for (int i = 0; i < weekLength; i++) {
    // print('Weekrecord: i is: $i value is: ${valuesOfWeek[i]}');
    weekRecord.add(ChartDataModel(daysOfWeek[i], valuesOfWeek[i].toInt()));
  }

  // print('Show empty chart while waiting for the data to load');
  return [
    charts.Series<ChartDataModel, DateTime>(
      id: 'Week',
      colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
      domainFn: (ChartDataModel chartDataModel, _) => chartDataModel.horiValue,
      measureFn: (ChartDataModel chartDataModel, _) => chartDataModel.vertiValue,
      data: weekRecord,
    )
  ];
}
