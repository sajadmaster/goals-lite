import 'package:goals_lite/models/record.dart';
import 'package:goals_lite/_shared/my_classes.dart';

class Stats {
  final List<Record> recordList;
  Stats(this.recordList);

  List<double> getTodayStatsWidget() {
    DateTime todayDate = DateTime.now();
    // print('todayDate $todayDate');
    DateTime firstDayOfMonth = DateTime(todayDate.year, todayDate.month, 1);
    // print('firstDayOfMonth $firstDayOfMonth');
    DateTime lastDayOfMonth = DateTime(todayDate.year, todayDate.month + 1, 0);
    // print('lastDayOfMonth $lastDayOfMonth');

    double todayValue = 0;
    double monthValue = 0;
    double totalValue = 0;

    for (Record record in recordList) {
      // Today
      if (DateOnlyCompareItem(record.getDateTime).isSameDate(todayDate)) {
        todayValue += record.getValue;
        // print('Today Record. Date: ${record.getDateTime} value: ${record.getValue} GoalID: ${record.getGoalID}');
      }

      // Month
      if (DateOnlyCompareItem(record.getDateTime).isAfterDate(firstDayOfMonth) &&
          DateOnlyCompareItem(record.getDateTime).isBeforeDate(lastDayOfMonth)) {
        monthValue += record.getValue;
        // print('Month Record. Date: ${record.getDateTime} value: ${record.getValue} GoalID: ${record.getGoalID}');
      }
      // Total
      totalValue += record.getValue;
    }

    List<double> statValuesList = [todayValue, monthValue, totalValue];
    return statValuesList;
  }
}
