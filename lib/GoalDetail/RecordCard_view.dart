import 'package:flutter/material.dart';
import 'package:goals_lite/GoalDetail/ThreeDots_recordCard.dart';
import 'package:goals_lite/Record/record.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatelessWidget {
  final Record record;
  const RecordCard({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  DateFormat.yMMMd().format(record.getDateTime),
                  style: const TextStyle(
                      color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  DateFormat.Hm().format(record.getDateTime),
                  style: const TextStyle(
                      color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ThreeDots_recordCard(context, record),
              ],
            ),
            Text('3.5km'),
          ],
        ),
      ),
    );
  }
}
