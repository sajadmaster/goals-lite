import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:goals_lite/models/goal.dart';
import 'package:goals_lite/widgets/button_round_elevated.dart';
import 'package:goals_lite/_shared/my_colors.dart';
import 'package:goals_lite/_shared/my_constants.dart';
import 'package:goals_lite/_shared/my_strings.dart';

class CreateGoalPopUp extends StatefulWidget {
  const CreateGoalPopUp({Key? key}) : super(key: key);

  @override
  _CreateGoalPopUpState createState() => _CreateGoalPopUpState();
}

class _CreateGoalPopUpState extends State<CreateGoalPopUp> {
  bool isErrorVisible = false;
  static TextEditingController goalNameController = TextEditingController();
  static TextEditingController goalUnitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize variables
    goalNameController.text = '';
    goalUnitController.text = '';
  }

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
                style: TextStyle(color: blue2, fontSize: 20, fontWeight: FontWeight.bold),
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
                    border: UnderlineInputBorder(), labelText: GOAL_UNIT, helperText: EX_KM_KILOMETER_MI_MILE),
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
                  TextButton(onPressed: () => {Navigator.pop(context)}, child: const Text(CLOSE)),
                  const SizedBox(width: 20),
                  RoundElevatedButton(
                    buttonText: SAVE,
                    onPress: () async {
                      Goal goal = Goal(name: goalNameController.text, unit: goalUnitController.text);
                      if (goal.getName == '' || goal.getUnit == '') {
                        setState(() {
                          isErrorVisible = true;
                        });
                        return;
                      }
                      await Goal.add(goal);
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => DashboardPage(),
                          transitionDuration: Duration.zero,
                        ),
                      );
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
