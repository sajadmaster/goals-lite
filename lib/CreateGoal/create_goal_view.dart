import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';

class CreateGoalPopUp extends StatelessWidget {
  const CreateGoalPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
      height: 400,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a goal',
              style: TextStyle(
                  color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Goal name',
                helperText: 'ex: Run, Study, Swim',
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Goal unit',
                  helperText: 'ex: km (kilometer), mi (mile), hr (hour)'),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => {}, child: Text('Close')),
                SizedBox(width: 20),
                RoundElevatedButton(
                  buttonText: 'Save',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class CreateGoal extends StatefulWidget {
//   CreateGoal();

//   @override
//   _CreateGoalState createState() => _CreateGoalState();
// }

// class _CreateGoalState extends State<CreateGoal> {
//   get blue2 => null;

//   @override
//   void initState() {
//     super.initState();
//     showBarModalBottomSheet(
//       context: context,
    //   builder: (context) => Container(
    //     padding: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
    //     height: 400,
    //     child: Align(
    //       alignment: Alignment.centerLeft,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Create a goal',
    //             style: TextStyle(
    //                 color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           SizedBox(height: 25),
    //           TextFormField(
    //             decoration: const InputDecoration(
    //               border: UnderlineInputBorder(),
    //               labelText: 'Goal name',
    //               helperText: 'ex: Run, Study, Swim',
    //             ),
    //           ),
    //           SizedBox(height: 25),
    //           TextFormField(
    //             decoration: const InputDecoration(
    //                 border: UnderlineInputBorder(),
    //                 labelText: 'Goal unit',
    //                 helperText: 'ex: km (kilometer), mi (mile), hr (hour)'),
    //           ),
    //           SizedBox(height: 25),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               TextButton(onPressed: () => {}, child: Text('Close')),
    //               ElevatedButton(onPressed: () => {}, child: Text('Save')),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
