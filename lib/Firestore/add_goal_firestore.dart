import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/models/goal_model.dart';

class AddGoalFirestore {
  CollectionReference goals = FirebaseFirestore.instance.collection('goals');

  Future<void> addGoal() {
    // Call the user's CollectionReference to add a new goal
    return goals
        .add({
          'goal_name': "sajad goal name",
          'goal_unit': "sajad goal unit",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
