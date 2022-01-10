import 'package:flutter/material.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/_shared/my_strings.dart';
import 'goal.dart';

class CreateGoalPopUp extends StatefulWidget {
  CreateGoalPopUp();

  @override
  _CreateGoalPopUpState createState() => _CreateGoalPopUpState();
}

class _CreateGoalPopUpState extends State<CreateGoalPopUp> {
  bool isErrorVisible = false;
  static TextEditingController goalNameController = TextEditingController();
  static TextEditingController goalUnitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 5),
        height: 350,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                CREATE_A_GOAL,
                style: TextStyle(
                    color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: goalNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: GOAL_NAME,
                  helperText: EX_RUN_STUDY_SWIM,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: goalUnitController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: GOAL_UNIT,
                    helperText: EX_KM_KILOMETER_MI_MILE),
              ),
              const SizedBox(height: 5),
              Visibility(
                visible: isErrorVisible,
                child: Text(
                  ERROR_GOAL_NAME_OR_GOAL_UNIT_EMPTY,
                  style: TextStyle(color: red4),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text(CLOSE)),
                  const SizedBox(width: 20),
                  RoundElevatedButton(
                    buttonText: SAVE,
                    onPress: () async {
                      Goal goal = Goal(
                          goalName: goalNameController.text,
                          goalUnit: goalUnitController.text);

                      String response = await Goal.AddGoal(goal);
                      print('response $response');

                      if (response == emptyTextFieldErr) {
                        setState(() {
                          isErrorVisible = true;
                        });
                      } else if (response == success) {
                        Navigator.pop(context);
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
}
