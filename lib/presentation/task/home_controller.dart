import 'package:flutter/cupertino.dart';

import '../../domain/model/task.dart';

class HomeController {
  TextEditingController taskTextEditingController = TextEditingController();
  List<Task> taskList = [];

  void addTask() {
    if (taskTextEditingController.text.isNotEmpty) {
      final newTask = Task(description: taskTextEditingController.text);
      taskList.add(newTask);
      taskTextEditingController.clear();
    }
  }

  void updateStatusTask(int index, bool? isCompletedTask) {
    taskList[index].completed = isCompletedTask ?? false;
  }

  void onRemovedTaskOfList(int index) {
    taskList.removeAt(index);
  }
}
