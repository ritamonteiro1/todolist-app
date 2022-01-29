import '../model/task.dart';

class AddTaskUseCase {
  void add(String typedTask, List<Task> taskList) {
    if (typedTask.isNotEmpty) {
      final newTask = Task(description: typedTask);
      taskList.add(newTask);
      //taskTextEditingController.clear();
    }
  }
}
