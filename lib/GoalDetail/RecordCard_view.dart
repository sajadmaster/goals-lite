import 'package:flutter/material.dart';
import 'package:goals_lite/GoalDetail/ThreeDots_recordCard.dart';
import 'package:goals_lite/models/record.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatelessWidget {
  final Record record;
  final String goalUnit;
  const RecordCard({Key? key, required this.record, required this.goalUnit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    DateFormat.yMMMd().format(record.getDateTime),
                    style: const TextStyle(color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat.Hm().format(record.getDateTime),
                    style: const TextStyle(color: black2, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ThreeDots_recordCard(context, record),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                record.getValue.toString() + ' ' + goalUnit,
                style: TextStyle(color: black2, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
