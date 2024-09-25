
import 'package:flutter_practice/model/sharedPreference/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todo = "todos";

class TaskRepo {
  TaskRepo({required this.preferences});
  final SharedPreferences preferences;
  void addTask(TaskModel task) async {
    var data = preferences.getString(todo) ?? '{$todo}';
    print(data);
  }

  void updateTask() async {}

  void deleteTask() async {}
}
