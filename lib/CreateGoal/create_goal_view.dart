import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'create_goal_controller.dart';

class CreateGoalPopUp extends StatefulWidget {
  const CreateGoalPopUp({Key? key}) : super(key: key);

  @override
  _CreateGoalPopUpState createState() => _CreateGoalPopUpState();
}

class _CreateGoalPopUpState extends State<CreateGoalPopUp> {
  var isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController goalNameController = TextEditingController();
    TextEditingController goalUnitController = TextEditingController();

    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
      height: 450,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create a goal',
              style: TextStyle(
                  color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: goalNameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Goal name',
                helperText: 'ex: Run, Study, Swim',
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: goalUnitController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Goal unit',
                  helperText: 'ex: km (kilometer), mi (mile), hr (hour)'),
            ),
            const SizedBox(height: 5),
            Visibility(
              visible: isErrorVisible,
              child: Text(
                'Error: Goal name or goal unit is empty.',
                style: TextStyle(color: red4),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => {CreateGoalController.closePopup(context)},
                    child: const Text('Close')),
                const SizedBox(width: 20),
                RoundElevatedButton(
                  buttonText: 'Save',
                  onPress: () {
                    String response = CreateGoalController.SaveGoal(
                        goalName: goalNameController.text,
                        goalUnit: goalUnitController.text);

                    if (response == emptyTextFieldErr) {
                      setState(() {
                        isErrorVisible = true;
                      });
                    } else if (response == success) {
                      CreateGoalController.closePopup(context);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class CreateGoalPopUp extends StatelessWidget {
//   CreateGoalPopUp();

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController goalNameController = TextEditingController();
//     TextEditingController goalUnitController = TextEditingController();
//     var isErrorVisible = false;

//     return Container(
//       padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
//       height: 450,
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Create a goal',
//               style: TextStyle(
//                   color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 25),
//             TextFormField(
//               controller: goalNameController,
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(),
//                 labelText: 'Goal name',
//                 helperText: 'ex: Run, Study, Swim',
//               ),
//             ),
//             const SizedBox(height: 25),
//             TextFormField(
//               controller: goalUnitController,
//               decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Goal unit',
//                   helperText: 'ex: km (kilometer), mi (mile), hr (hour)'),
//             ),
//             const SizedBox(height: 5),
//             Visibility(
//               visible: isErrorVisible,
//               child: Text(
//                 'Error: Goal name or goal unit is empty.',
//                 style: TextStyle(color: red4),
//               ),
//             ),
//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () => {CreateGoalController.closePopup(context)},
//                     child: const Text('Close')),
//                 const SizedBox(width: 20),
//                 RoundElevatedButton(
//                   buttonText: 'Save',
//                   onPress: () {
//                     String response = CreateGoalController.SaveGoal(
//                         goalName: goalNameController.text,
//                         goalUnit: goalUnitController.text);
//                     print('response $response');
//                     CreateGoalController.closePopup(context);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
