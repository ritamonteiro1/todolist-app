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
  final List<Task> taskList;

  void addTask(String typedTask) {
    addTaskUseCase.add(typedTask, taskList);
  }

  void removeTask(int index) {
    removeTaskUseCase.remove(index, taskList);
  }

  void updateTask(int index, bool? isCompletedTask) {
    updateStatusTaskUseCase.update(index, isCompletedTask, taskList);
  }
}
