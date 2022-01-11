import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Record {
  Record({this.id, required this.dateTime, required this.value, required this.goalID});

  String? id;
  DateTime dateTime;
  double value;
  String goalID;

  get getId => this.id;
  set setId(id) => this.id = id;
  get getDateTime => this.dateTime;
  set setDateTime(dateTime) => this.dateTime = dateTime;
  get getValue => this.value;
  set setValue(value) => this.value = value;
  get getGoalID => this.goalID;
  set setGoalID(goalID) => this.goalID = goalID;

  // Add Record
  static Future<String> add(Record record) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;

    // Firestore Add Record
    CollectionReference records = FirebaseFirestore.instance.collection('records');
    await records
        .add({
          'recordValue': record.getValue,
          'recordDateTime': record.getDateTime,
          'userID': userID,
          'goalID': record.getGoalID,
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Record: $error"));
    return SUCCESS;
  }
}
