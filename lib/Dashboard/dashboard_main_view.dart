// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 30,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              GOALS,
              style: TextStyle(fontSize: 18, fontFamily: 'Jalnan'),
            ),
            SizedBox(width: 5),
            Text(
              LITE,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
        ),
        child: DoashboardBody(),
      ),
    );
  }
}
