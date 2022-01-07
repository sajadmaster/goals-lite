import 'package:flutter/material.dart';

class DashboardEmptyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Image(
                  image: AssetImage('assets/images/dashboard_empty_bg.png'),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('Set your goal and get started!',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => {print('btn')},
              child: Text(
                'Create Goal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))))),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
