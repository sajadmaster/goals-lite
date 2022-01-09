import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    'Run',
                    style: TextStyle(
                        color: black2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.more_vert),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  RecordColumn(),
                  Spacer(),
                  RecordColumn(),
                  Spacer(),
                  RecordColumn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecordColumn extends StatelessWidget {
  RecordColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '8.5',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: black2),
        ),
        SizedBox(height: 2),
        Text('Today (km)'),
      ],
    );
  }
}
