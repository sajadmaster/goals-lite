import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'record.g.dart';

@HiveType(typeId: 1) //Add this Line
class Record extends HiveObject {
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
    Box recordBox = await Hive.openBox<Record>('recordBox');
    recordBox.add(record);
    return SUCCESS;
  }

  static deleteRecord(Record record) async {
    Box recordBox = await Hive.openBox<Record>('recordBox');
    recordBox.delete(record.key);
  }

  static Future<Iterable<Record>> getRecordList(Goal goal) async {
    Box recordBox = await Hive.openBox<Record>('recordBox');
    Iterable<Record> recordList = recordBox.values as Iterable<Record>;
    return recordList.where((record) => record.getGoalID == goal.key);
  }
}
