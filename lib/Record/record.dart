import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goals_lite/Goal/goal.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Record {
  Record(
      {this.ID,
      required this.dateTime,
      required this.value,
      required this.goalID});

  String? ID;
  DateTime dateTime;
  double value;
  String goalID;

  get getID => this.ID;
  set setID(id) => this.ID = id;
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
    CollectionReference records =
        FirebaseFirestore.instance.collection('records');
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

  static Future<String> delete(Record record) {
    print('Request deleting recordID: ${record.getID}');
    CollectionReference recordsCollection =
        FirebaseFirestore.instance.collection('records');
    return recordsCollection
        .doc(record.getID)
        .delete()
        .then((value) => SUCCESS)
        .catchError((error) => FAILED_DELETE_GOAL);
  }

  static Future<List<Record>> getRecordList(Goal goal) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("records")
        .where('userID', isEqualTo: userID)
        .where('goalID', isEqualTo: goal.getID)
        .get();
    List<Record> recordsList = querySnapshot.docs
        .map(
          (doc) => Record(
              ID: doc.reference.id,
              value: doc["recordValue"],
              dateTime: doc['recordDateTime'].toDate(),
              goalID: doc['goalID']),
        )
        .toList();
    print('Sajad recordsList is: ${recordsList.length}');
    return recordsList;
  }

  // Get Today
  // static Future<String> getToday(Goal goal) async {
  //   String userID = FirebaseAuth.instance.currentUser!.uid;

  //   // Firestore Get List of Records for Today
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection("records")
  //       .where('userID', isEqualTo: userID)
  //       .where('goalID', isEqualTo: goal.getID)
  //       .get();
  //   List<Record> recordsList = querySnapshot.docs
  //       .map((doc) => Record(
  //           id: doc.reference.id,
  //           value: doc["recordValue"],
  //           dateTime: doc['recordValue'],
  //           goalID: doc['goalID']))
  //       .toList();
  //   print('sajad recordsList length ${recordsList.length}');

  //   return SUCCESS;
  // }
}
