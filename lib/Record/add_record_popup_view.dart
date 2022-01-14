import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/models/record.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'package:intl/intl.dart';

class AddRecordPopup extends StatefulWidget {
  AddRecordPopup({Key? key, required this.goal}) : super(key: key);
  final Goal goal;

  @override
  _AddRecordPopupState createState() => _AddRecordPopupState();
}

class _AddRecordPopupState extends State<AddRecordPopup> {
  bool isErrorVisible = false;
  static TextEditingController recordValueController = TextEditingController();
  DateTime date = DateTime.now();

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
              // Goal name
              Text(
                widget.goal.getName,
                style: TextStyle(color: blue2, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              // Date Row
              MyRow(
                  iconData: Icons.calendar_today_sharp,
                  title: DATE,
                  dateFormat: DateFormat.yMMMd().format(date),
                  onTapped: () {
                    datePicker(context);
                  }),
              // Time Row
              MyRow(
                  iconData: Icons.access_time,
                  title: TIME,
                  dateFormat: DateFormat.Hm().format(date),
                  onTapped: () {
                    timePicker(context);
                  }),
              const SizedBox(height: 10),
              // Enter data
              TextFormField(
                controller: recordValueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: ENTER_DATA_HERE,
                  hintText: '0.0',
                  suffixText: widget.goal.getUnit,
                ),
              ),
              const SizedBox(height: 5),
              Visibility(
                visible: isErrorVisible,
                child: const Text(
                  ERROR_PLEASE_ENTER_DATA_HERE,
                  style: TextStyle(color: red4),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Close button
                  TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text(CLOSE)),
                  const SizedBox(width: 20),
                  // Save button
                  RoundElevatedButton(
                    buttonText: SAVE,
                    onPress: () async {
                      // Save record
                      if (recordValueController.text != '') {
                        print('Save button. widget.date: $date');
                        Record record = Record(
                            dateTime: date, value: double.parse(recordValueController.text), goalID: widget.goal.key);
                        await Record.add(record);
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => DashboardPage(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      } else {
                        setState(() {
                          isErrorVisible = true;
                        });
                      }
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
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null && selectedDate != date) {
      setState(() {
        date = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, date.hour, date.minute);
      });
    }
  }

  timePicker(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        date = DateTime(date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute);
      });
    }
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
