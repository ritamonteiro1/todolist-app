import 'package:flutter_test/flutter_test.dart';
import 'package:todolistapp/domain/model/task.dart';
import 'package:todolistapp/domain/use_case/add_task_use_case.dart';

void main() {
  late AddTaskUseCase addTaskUseCase;
  setUpAll(() {
    addTaskUseCase = AddTaskUseCase();
  });
  group('GIVEN a call on add', () {
    test(
        'WHEN typedTask is not empty THEN it should return task list length = 2',
        () async {
      final tasks = <Task>[Task(description: 'task 1')];
      final taskList = addTaskUseCase.add('task 2', tasks);
      expect(taskList.length, 2);
    });
    test('WHEN typedTask is empty THEN it should return task list length = 1',
        () async {
      final tasks = <Task>[Task(description: 'task 1')];
      final taskList = addTaskUseCase.add('', tasks);
      expect(taskList.length, 1);
    });
  });
}
