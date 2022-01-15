import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:goals_lite/GoalDetail/Chart/MonthDataGenerator.dart';
import 'package:goals_lite/models/record.dart';
import 'WeekDataGenerator.dart';

class ChartDataModel {
  final DateTime horiValue;
  final int vertiValue;

  ChartDataModel(this.horiValue, this.vertiValue);
}

class RecordChart extends StatelessWidget {
  final List<charts.Series<ChartDataModel, DateTime>> seriesList;

  RecordChart(this.seriesList);

  factory RecordChart.showWeekData(Iterable<Record> recordList) {
    return RecordChart(
      WeekDataGenerator(recordList),
    );
  }

  factory RecordChart.showMonthData(Iterable<Record> recordList) {
    return RecordChart(
      getMonthData(recordList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      defaultRenderer: charts.BarRendererConfig<DateTime>(),
      defaultInteractions: false,
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],
    );
  }
}
