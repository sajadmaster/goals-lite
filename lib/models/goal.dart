import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/models/record.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'goal.g.dart';

// flutter packages pub run build_runner build
@HiveType(typeId: 0) //Add this Line
class Goal extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String unit;

  Goal({required this.name, required this.unit});

  get getName => this.name;
  set setName(goalName) => this.name = goalName;
  get getUnit => this.unit;
  set setUnit(goalUnit) => this.unit = goalUnit;

// Add Goal
  static add(Goal goal) async {
    Box goalBox = await Hive.openBox<Goal>('goalBox');
    goalBox.add(goal);
    print('Goal key is: ${goal.key}');
  }

  static Future<Iterable<Goal>> getAll() async {
    Box goalBox = await Hive.openBox<Goal>('goalBox');
    Iterable<Goal> goalList = goalBox.values as Iterable<Goal>;

    return goalList;
  }

  static deleteGoal(Goal goal) async {
    // Delete records linked with this goal
    Box recordBox = await Hive.openBox<Record>('recordBox');
    Iterable<Record> recordList = await Record.getRecordList(goal);
    for (Record record in recordList) {
      print('Record Deleted: GoalID: ${record.getGoalID} Key ${record.key}');

      recordBox.delete(record.key);
    }
    Box goalBox = await Hive.openBox<Goal>('goalBox');
    print('Goal Deleted: Key: ${goal.key}');

    goalBox.delete(goal.key);
  }
}
