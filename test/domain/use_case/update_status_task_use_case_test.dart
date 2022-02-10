import 'package:flutter_test/flutter_test.dart';
import 'package:todolistapp/domain/model/task.dart';
import 'package:todolistapp/domain/use_case/update_status_task_use_case.dart';

void main() {
  late UpdateStatusTaskUseCase updateStatusTaskUseCase;
  setUpAll(() {
    updateStatusTaskUseCase = UpdateStatusTaskUseCase();
  });
  group('GIVEN a call on update', () {
    test(
        'WHEN completed attribute index 0 of tasks = false '
        'THEN it should return completed attribute index 0 of tasks = true',
        () async {
      final tasks = <Task>[
        Task(description: 'task 1', completed: false),
        Task(description: 'task 2'),
      ];
      final taskList = updateStatusTaskUseCase.update(0, true, tasks);
      expect(taskList[0].completed, true);
    });
  });
}
