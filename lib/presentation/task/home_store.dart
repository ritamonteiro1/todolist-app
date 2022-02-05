import 'package:mobx/mobx.dart';
import 'package:todolistapp/domain/use_case/remove_task_use_case.dart';
import 'package:todolistapp/domain/use_case/update_status_task_use_case.dart';

import '../../domain/model/task.dart';
import '../../domain/use_case/add_task_use_case.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore(
    this.addTaskUseCase,
    this.removeTaskUseCase,
    this.updateStatusTaskUseCase,
  );

  final AddTaskUseCase addTaskUseCase;
  final RemoveTaskUseCase removeTaskUseCase;
  final UpdateStatusTaskUseCase updateStatusTaskUseCase;

  @observable
  bool isTypedTaskDescriptionValid = false;

  @action
  void setTypedTaskDescription(String? typedValue) {
    if (typedValue != null && typedValue.isNotEmpty) {
      isTypedTaskDescriptionValid = true;
    } else {
      isTypedTaskDescriptionValid = false;
    }
  }

  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([]);

  @action
  void addTask(String typedTask) {
    if (typedTask.isNotEmpty) {
      taskList.add(Task(description: typedTask));
    }
  }

  @action
  void removeTask(int index) {
    taskList.removeAt(index);
  }

  @action
  void updateTask(int index, bool? isCompletedTask) {
    taskList[index].completed = isCompletedTask ?? false;
  }
}
