class GoalModel {
  GoalModel({required this.goalName, required this.goalUnit});

  String goalName;
  String goalUnit;

  String get getGoalName => this.goalName;
  set setGoalName(String goalName) => this.goalName = goalName;

  get getGoalUnit => this.goalUnit;
  set setGoalUnit(goalUnit) => this.goalUnit = goalUnit;
}
