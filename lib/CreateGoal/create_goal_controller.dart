import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/models/goal_model.dart';

class CreateGoalController {
  static void closePopup(context) {
    Navigator.pop(context);
  }

  static Future<String> SaveGoal(GoalModel goalModel) async {
    if (goalModel.getGoalName == '' || goalModel.getGoalUnit == '') {
      return emptyTextFieldErr;
    }
    print(goalModel.getGoalName);

    // Firestore Add Goal
    CollectionReference goals = FirebaseFirestore.instance.collection('goals');
    await goals
        .add({
          'goal_name': goalModel.getGoalName,
          'goal_unit': goalModel.getGoalUnit,
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Goal: $error"));
    return success;
  }
}
