import 'package:flutter/material.dart';

Future<bool?> DeleteGoalAlert(context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete Goal?'),
      content: const Text(
          'Are you sure that you want to delete this goal? \nAll your data for this goal will be permanently removed.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {Navigator.pop(context, true)},
          child: const Text('Delete Goal'),
        ),
      ],
    ),
  );
}
