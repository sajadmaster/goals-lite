import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goals_lite/_shared/my_constants.dart';

class Goal {
  Goal({this.id, required this.name, required this.unit});

  String? id;
  String name;
  String unit;

  get getID => this.id;
  set setID(goalID) => this.id = goalID;
  get getName => this.name;
  set setName(goalName) => this.name = goalName;
  get getUnit => this.unit;
  set setUnit(goalUnit) => this.unit = goalUnit;

  // Add Goal
  static Future<String> add(Goal goal) async {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    print('sajad userID:' + userID);

    if (goal.getName == '' || goal.getUnit == '') {
      return EMPTY_TEXTFIELD_ERR;
    }
    // Firestore Add Goal
    CollectionReference goals = FirebaseFirestore.instance.collection('goals');
    await goals
        .add({
          'goalName': goal.getName,
          'goalUnit': goal.getUnit,
          'userID': userID
        })
        .then((value) => print("value $value"))
        .catchError((error) => print("Failed to add Goal: $error"));
    return SUCCESS;
  }

  static Future<String> delete(Goal goal) {
    print('Request deleting goalID: ${goal.getID}');
    CollectionReference goalsCollection =
        FirebaseFirestore.instance.collection('goals');
    return goalsCollection
        .doc(goal.getID)
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
            id: doc.reference.id, name: doc["goalName"], unit: doc['goalUnit']))
        .toList();
    return goalsList;
  }
}
