import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive Database Initialization
  // await Hive.initFlutter().whenComplete(() => print('Sajad Hive.initFlutter done'));
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Registering adapters
  Hive.registerAdapter(GoalAdapter());
  // Opening boxes
  // await Hive.openBox<GoalAdapter>('goalBox');

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
        home: SplashScreen());
  }
}
