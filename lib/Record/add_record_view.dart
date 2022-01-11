import 'package:flutter/material.dart';
import 'package:goals_lite/Record/record.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:intl/intl.dart';

class AddRecordPopup extends StatefulWidget {
  AddRecordPopup();
  DateTime dateTime = DateTime.now();
  final dateFormat = new DateFormat('yyyy-MM-dd hh:mm');

  @override
  _AddRecordPopupState createState() => _AddRecordPopupState();
}

class _AddRecordPopupState extends State<AddRecordPopup> {
  bool isErrorVisible = false;
  static TextEditingController recordValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 5),
        height: 400,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Run',
                style: TextStyle(color: blue2, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              // Date Row
              MyRow(
                  iconData: Icons.calendar_today_sharp,
                  title: DATE,
                  dateFormat: DateFormat.yMMMd().format(widget.dateTime),
                  onTapped: () {
                    print("Date Row clicked");
                    datePicker(context);
                  }),
              // Time Row
              MyRow(
                  iconData: Icons.access_time,
                  title: TIME,
                  dateFormat: DateFormat.Hm().format(widget.dateTime),
                  onTapped: () {
                    print("Time Row clicked");
                  }),
              const SizedBox(height: 25),
              TextFormField(
                controller: recordValueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: ENTER_DATA_HERE,
                  hintText: '0.0',
                  suffixText: 'hr',
                ),
              ),
              const SizedBox(height: 5),
              Visibility(
                visible: isErrorVisible,
                child: Text(
                  ERROR_PLEASE_ENTER_DATA_HERE,
                  style: TextStyle(color: red4),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text(CLOSE)),
                  const SizedBox(width: 20),
                  RoundElevatedButton(
                    buttonText: SAVE,
                    onPress: () async {
                      Record record = Record(dateTime: '2022-01-13', value: double.parse(recordValueController.text));
                      Record.add(record);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  datePicker(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: widget.dateTime,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != widget.dateTime)
      setState(() {
        widget.dateTime = selected;
      });
  }
}

Widget MyRow({required iconData, required title, required dateFormat, required Function onTapped}) {
  return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTapped();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Icon(
              iconData,
              color: blue2,
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Text(
              dateFormat,
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ));
}
