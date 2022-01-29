import 'package:flutter/material.dart';
import '../../../domain/task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    required this.task,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final Task task;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        value: task.completed,
        onChanged: onChanged,
        title: Text(
          task.description,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        secondary: Icon(
          task.completed ? Icons.check_circle : Icons.error,
        ),
      );
}
