// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_with_content_view.dart';
import 'package:goals_lite/_shared/my_colors.dart';

import 'dashboard_no_content_view.dart';

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
        centerTitle: false,
        title: Text(
          'Good luck with your goals :)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: DashboardWithContent(),
      ),
    );
  }
}
