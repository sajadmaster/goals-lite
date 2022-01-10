import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Goal {
  Goal({this.goalID, required this.goalName, required this.goalUnit});

  String? goalID;
  String goalName;
  String goalUnit;

  get getGoalID => this.goalID;
  set setGoalID(goalID) => this.goalID = goalID;
  get getGoalName => this.goalName;
  set setGoalName(goalName) => this.goalName = goalName;
  get getGoalUnit => this.goalUnit;
  set setGoalUnit(goalUnit) => this.goalUnit = goalUnit;

  // Add Goal
  static Future<String> add(Goal goal) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    print('sajad userID:' + userID);

    if (goal.getGoalName == '' || goal.getGoalUnit == '') {
      return EMPTY_TEXTFIELD_ERR;
    }
    // Firestore Add Goal
    CollectionReference goals = FirebaseFirestore.instance.collection('goals');
    await goals
        .add({
          'goalName': goal.getGoalName,
          'goalUnit': goal.getGoalUnit,
          'userID': userID
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Goal: $error"));
    return SUCCESS;
  }

  static Future<String> delete(Goal goal) {
    print('Request deleting goalID: ${goal.getGoalID}');
    CollectionReference goalsCollection =
        FirebaseFirestore.instance.collection('goals');
    return goalsCollection
        .doc(goal.getGoalID)
        .delete()
        .then((value) => SUCCESS)
        .catchError((error) => FAILED_DELETE_GOAL);
  }

  static Future<List<Goal>> getGoalsList() async {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("goals")
        .where('userID', isEqualTo: userID)
        .get();
    List<Goal> goalsList = querySnapshot.docs
        .map((doc) => Goal(
            goalID: doc.reference.id,
            goalName: doc["goalName"],
            goalUnit: doc['goalUnit']))
        .toList();
    print('sajad goalsList length ${goalsList.length}');

    return goalsList;
  }
}
