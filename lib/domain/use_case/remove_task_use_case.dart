import '../model/task.dart';

class RemoveTaskUseCase {
  void remove(int index, List<Task> taskList) {
    taskList.removeAt(index);
  }
}
