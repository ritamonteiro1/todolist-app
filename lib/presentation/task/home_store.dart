import 'package:mobx/mobx.dart';

import '../../domain/model/task.dart';
import '../../domain/use_case/add_task_use_case.dart';
import '../../domain/use_case/remove_task_use_case.dart';
import '../../domain/use_case/update_status_task_use_case.dart';

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
  bool isFilledDescriptionTaskField = false;

  @action
  void setTypedTaskDescription(String? typedValue) {
    if (typedValue != null && typedValue.isNotEmpty) {
      isFilledDescriptionTaskField = true;
    } else {
      isFilledDescriptionTaskField = false;
    }
  }

  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([]);

  @action
  void addTask(String typedTask) {
    if (typedTask.isNotEmpty) {
      final tasks = addTaskUseCase.add(typedTask, taskList);
      taskList = tasks.asObservable();
      isFilledDescriptionTaskField = false;
    }
  }

  @action
  void removeTask(int index) {
    final tasks = removeTaskUseCase.remove(index, taskList);
    taskList = tasks.asObservable();
  }

  @action
  void updateTask(int index, bool? isCompletedTask) {
    final tasks =
        updateStatusTaskUseCase.update(index, isCompletedTask, taskList);
    taskList = tasks.asObservable();
  }
}
