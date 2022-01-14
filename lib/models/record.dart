import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'record.g.dart';

@HiveType(typeId: 1) //Add this Line
class Record {
  @HiveField(0)
  String? ID;
  @HiveField(1)
  DateTime dateTime;
  @HiveField(2)
  double value;
  @HiveField(3)
  int goalID;

  Record({this.ID, required this.dateTime, required this.value, required this.goalID});

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
    if (record.getValue == null) {
      return EMPTY_TEXTFIELD_ERR;
    }
    print('record data before save: Value: ${record.getValue} goalID: ${record.getGoalID}');

    Box recordBox = await Hive.openBox<Record>('recordBox');
    recordBox.add(record);
    Record recordNew = recordBox.get(0);
    print('Sajad recordNew: ${recordNew.getValue}');
    return SUCCESS;
  }

  // static Future<String> add(Record record) async {
  //   String userID = FirebaseAuth.instance.currentUser!.uid;

  //   // Firestore Add Record
  //   CollectionReference records = FirebaseFirestore.instance.collection('records');
  //   await records
  //       .add({
  //         'recordValue': record.getValue,
  //         'recordDateTime': record.getDateTime,
  //         'userID': userID,
  //         'goalID': record.getGoalID,
  //       })
  //       .then((value) => print("value $value"))
  //       .catchError((error) => print("Failed to add Record: $error"));
  //   return SUCCESS;
  // }

  static Future<String> delete(Record record) {
    print('Request deleting recordID: ${record.getID}');
    CollectionReference recordsCollection = FirebaseFirestore.instance.collection('records');
    return recordsCollection
        .doc(record.getID)
        .delete()
        .then((value) => SUCCESS)
        .catchError((error) => FAILED_DELETE_GOAL);
  }

  static Future<Iterable<Record>> getRecordListHive(Goal goal) async {
    Box recordBox = await Hive.openBox<Record>('recordBox');
    Iterable<Record> recordList = recordBox.values as Iterable<Record>;
    return recordList.where((record) => record.getGoalID == goal.key);
    // .forEach((record) => print('Found Record: GoalID: ${record.getGoalID} Value: ${record.getValue}'));
  }

  static Future<List<Record>> getRecordList(Goal goal) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("records")
        .where('userID', isEqualTo: userID)
        .where('goalID', isEqualTo: goal.key)
        .get();
    List<Record> recordsList = querySnapshot.docs
        .map(
          (doc) => Record(
              ID: doc.reference.id,
              value: doc["recordValue"],
              dateTime: doc['recordDateTime'].toDate(),
              goalID: int.parse(doc['goalID'])),
        )
        .toList();
    return recordsList;
  }

  // static Future<List<Record>> getAllRecords(Goal goal) async {
  //   String userID = FirebaseAuth.instance.currentUser!.uid;
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection("records")
  //       .where('userID', isEqualTo: userID)
  //       .get();
  //   List<Record> allRecordsList = querySnapshot.docs
  //       .map(
  //         (doc) => Record(
  //             ID: doc.reference.id,
  //             value: doc["recordValue"],
  //             dateTime: doc['recordDateTime'].toDate(),
  //             goalID: doc['goalID']),
  //       )
  //       .toList();
  //   print('Sajad allRecordsList is: ${allRecordsList.length}');
  //   return allRecordsList;
  // }

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
