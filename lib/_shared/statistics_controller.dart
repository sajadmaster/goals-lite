import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/Record/record.dart';
import 'package:goals_lite/_shared/statistics_column_widget.dart';

class Stats {
  final List<Record> recordList;
  Stats(this.recordList);

  StatWidget getTodayStatsWidget() {
    double todayValue = 0;
    print('Record List: ${recordList[0].getDateTime}');

    Goal goal = Goal(name: 'name', unit: 'unit');
    return StatWidget(goal, todayValue);
  }
}
