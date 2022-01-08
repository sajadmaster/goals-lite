import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/models/goal_model.dart';

class CreateGoalController {
  static void closePopup(context) {
    Navigator.pop(context);
  }

  static String SaveGoal({goalName, goalUnit}) {
    // null check
    if (goalName == '' || goalUnit == '') {
      return emptyTextFieldErr;
    }
    GoalModel goalModel = new GoalModel(goalName: goalName, goalUnit: goalUnit);
    print(goalModel.getGoalName);
    return success;
  }
}
