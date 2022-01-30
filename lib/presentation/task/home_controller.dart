import 'package:todolistapp/domain/model/task.dart';

import '../../domain/use_case/add_task_use_case.dart';
import '../../domain/use_case/remove_task_use_case.dart';
import '../../domain/use_case/update_status_task_use_case.dart';

class HomeController {
  HomeController(
    this.addTaskUseCase,
    this.removeTaskUseCase,
    this.updateStatusTaskUseCase,
    this.taskList,
  );

  final AddTaskUseCase addTaskUseCase;
  final RemoveTaskUseCase removeTaskUseCase;
  final UpdateStatusTaskUseCase updateStatusTaskUseCase;
  List<Task> taskList;

  void addTask(String typedTask) {
    final tasks = addTaskUseCase.add(typedTask, taskList);
    taskList = tasks;
  }

  void removeTask(int index) {
    final tasks = removeTaskUseCase.remove(index, taskList);
    taskList = tasks;
  }

  void updateTask(int index, bool? isCompletedTask) {
    final tasks =
        updateStatusTaskUseCase.update(index, isCompletedTask, taskList);
    taskList = tasks;
  }
}
