import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Record {
  Record({this.id, required this.dateTime, required this.value});

  String? id;
  DateTime dateTime;
  double value;

  get getId => this.id;
  set setId(id) => this.id = id;
  get getDateTime => this.dateTime;
  set setDateTime(dateTime) => this.dateTime = dateTime;
  get getValue => this.value;
  set setValue(value) => this.value = value;

  // Add Record
  static Future<String> add(Record record) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;

    // Firestore Add Record
    CollectionReference records = FirebaseFirestore.instance.collection('records');
    await records
        .add({
          'recordValue': record.getValue,
          'recordDateTime': record.getDateTime,
          'userID': userID
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Record: $error"));
    return SUCCESS;
  }
}
