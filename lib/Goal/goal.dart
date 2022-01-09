import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Goal {
  Goal({required this.goalName, required this.goalUnit});

  String goalName;
  String goalUnit;
  get getGoalName => this.goalName;
  set setGoalName(goalName) => this.goalName = goalName;
  get getGoalUnit => this.goalUnit;
  set setGoalUnit(goalUnit) => this.goalUnit = goalUnit;

  // Save Goal
  static Future<String> SaveGoal(Goal goal) async {
    if (goal.getGoalName == '' || goal.getGoalUnit == '') {
      return emptyTextFieldErr;
    }
    // Firestore Add Goal
    CollectionReference goals = FirebaseFirestore.instance.collection('goals');
    await goals
        .add({
          'goal_name': goal.getGoalName,
          'goal_unit': goal.getGoalUnit,
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Goal: $error"));
    return success;
  }
}
