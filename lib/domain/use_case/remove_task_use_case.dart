import '../model/task.dart';

class RemoveTaskUseCase {
  List<Task> remove(int index, List<Task> taskList) {
    taskList.removeAt(index);
    return taskList;
  }
}
