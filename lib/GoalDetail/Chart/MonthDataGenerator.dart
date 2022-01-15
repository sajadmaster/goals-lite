import 'package:goals_lite/GoalDetail/Chart/Chart_controller.dart';
import 'package:goals_lite/_shared/my_classes.dart';
import 'package:goals_lite/models/record.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ############### Month
getMonthData(Iterable<Record> recordList) {
  DateTime todayDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int daysInMonth = DateTime(todayDate.year, todayDate.month + 1, 0).day;
  final firstDayOfMonth = DateTime(todayDate.year, todayDate.month, 1);

  print('today is $todayDate');
  List<ChartDataModel> monthRecord = [];
  List<double> valuesOfMonth = List.filled(daysInMonth, 0);
  List<DateTime> daysOfMonth = List.filled(daysInMonth, firstDayOfMonth);

  // Generate days of month from 1st last day of month
  for (int i = 0; i < daysInMonth; i++) {
    DateTime monthDay = firstDayOfMonth.add(Duration(days: firstDayOfMonth.day + i - 1));
    daysOfMonth[i] = monthDay;
  }

  // print('records value:');
  // Loop through all records and filter them for the selected week
  Record tempRecord;
  for (int i = 0; i < recordList.length; i++) {
    tempRecord = recordList.elementAt(i);
    for (int i = 0; i < daysOfMonth.length; i++) {
      // print('Compare: daysOfMonth[i]: ${daysOfMonth[i]} with tempRecord.getDateTime ${tempRecord.getDateTime}');
      if (DateOnlyCompareItem(tempRecord.getDateTime).isSameDate(daysOfMonth[i])) {
        // print('Matched date: ${tempRecord.getDateTime} Matched value: ${tempRecord.getDateTime} Matched i: $i');
        valuesOfMonth[i] += tempRecord.getValue;
      }
    }
  }

  // Weekrecord list: populate
  for (int i = 0; i < daysOfMonth.length; i++) {
    // print('Weekrecord: i is: $i value is: ${valuesOfWeek[i]}');
    monthRecord.add(ChartDataModel(daysOfMonth[i].day.toString(), valuesOfMonth[i].toInt()));
  }

  // print('Show empty chart while waiting for the data to load');
  return [
    charts.Series<ChartDataModel, String>(
      id: 'Month',
      colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
      domainFn: (ChartDataModel chartDataModel, _) => chartDataModel.horiValue,
      measureFn: (ChartDataModel chartDataModel, _) => chartDataModel.vertiValue,
      data: monthRecord,
    )
  ];
}
