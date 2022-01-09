import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class AddDataPopup extends StatefulWidget {
  AddDataPopup();

  @override
  _AddDataPopupState createState() => _AddDataPopupState();
}

class _AddDataPopupState extends State<AddDataPopup> {
  bool isErrorVisible = false;
  static TextEditingController dataValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 5),
        height: 350,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Run',
                style: TextStyle(
                    color: blue2, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              DateRow(),
              const SizedBox(height: 20),
              TimeRow(),
              const SizedBox(height: 25),
              TextFormField(
                controller: dataValueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter data',
                  hintText: '0.0',
                  suffixText: 'hr',
                ),
              ),
              const SizedBox(height: 5),
              Visibility(
                visible: isErrorVisible,
                child: Text(
                  'Error: Please enter data.',
                  style: TextStyle(color: red4),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Close')),
                  const SizedBox(width: 20),
                  RoundElevatedButton(
                    buttonText: 'Save',
                    onPress: () async {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget DateRow() {
  return Row(
    children: [
      Icon(
        Icons.calendar_today_sharp,
        color: blue2,
      ),
      SizedBox(width: 5),
      Text(
        'Date',
        style: TextStyle(fontSize: 18),
      ),
      Spacer(),
      Text(
        '2022.01.07',
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}

Widget TimeRow() {
  return Row(
    children: [
      Icon(
        Icons.access_time,
        color: blue2,
      ),
      SizedBox(width: 5),
      Text(
        'Time',
        style: TextStyle(fontSize: 18),
      ),
      Spacer(),
      Text(
        '09:30 AM',
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}
