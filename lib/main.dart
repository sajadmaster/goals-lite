import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/Signin/signin_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/models/record.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // added for login
  Firebase.initializeApp();

  // Hive Database Initialization
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Registering adapters
  Hive.registerAdapter(GoalAdapter());
  Hive.registerAdapter(RecordAdapter());

  // Delete all data from boxes
  // Box goalBox = await Hive.openBox<Goal>('goalBox');
  // goalBox.deleteFromDisk();
  // Box recordBox = await Hive.openBox<Record>('recordBox');
  // recordBox.deleteFromDisk();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: black2),
            button: TextStyle(fontSize: 16.0, color: black2),
          ),
        ),
        home: SigninPage());
  }
}
