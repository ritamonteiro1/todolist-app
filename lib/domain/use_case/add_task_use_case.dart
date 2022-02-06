import '../model/task.dart';

class AddTaskUseCase {
  List<Task> add(String typedTask, List<Task> taskList) {
    if (typedTask.isNotEmpty) {
      final newTask = Task(description: typedTask);
      taskList.insert(0, newTask);
      return taskList;
    } else {
      return taskList;
    }
  }
}
