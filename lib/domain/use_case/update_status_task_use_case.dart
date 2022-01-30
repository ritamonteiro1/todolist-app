import '../model/task.dart';

class UpdateStatusTaskUseCase {
  List<Task> update(int index, bool? isCompletedTask, List<Task> taskList) {
    taskList[index].completed = isCompletedTask ?? false;
    return taskList;
  }
}
