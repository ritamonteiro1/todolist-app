import 'package:flutter_test/flutter_test.dart';
import 'package:todolistapp/domain/model/task.dart';
import 'package:todolistapp/domain/use_case/remove_task_use_case.dart';

void main() {
  late RemoveTaskUseCase removeTaskUseCase;
  setUpAll(() {
    removeTaskUseCase = RemoveTaskUseCase();
  });
  group('GIVEN a call on remove', () {
    test('THEN it should return an task list length = 1', () async {
      final tasks = <Task>[
        Task(description: 'task 1'),
        Task(description: 'task 2'),
      ];
      final taskList = removeTaskUseCase.remove(1, tasks);
      expect(taskList.length, 1);
    });
  });
}
