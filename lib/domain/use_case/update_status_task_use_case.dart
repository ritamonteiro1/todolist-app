import '../model/task.dart';

class UpdateStatusTaskUseCase {
  void update(int index, bool? isCompletedTask, List<Task> taskList) {
    taskList[index].completed = isCompletedTask ?? false;
  }
}
