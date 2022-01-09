import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/Firestore/add_goal_firestore.dart';
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

    // Firestore
    CollectionReference goals = FirebaseFirestore.instance.collection('goals');
    await goals
        .add({
          'goal_name': "sajad goal name",
          'goal_unit': "sajad goal unit",
        })
        .then((value) => print("Goal Added"))
        .catchError((error) => print("Failed to add Goal: $error"));

    return success;
  }
}
