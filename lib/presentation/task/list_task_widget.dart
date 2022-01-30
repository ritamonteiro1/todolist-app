import 'package:flutter/material.dart';

import '../../domain/model/task.dart';
import 'task_item_widget.dart';

class ListTaskWidget extends StatelessWidget {
  const ListTaskWidget({
    required this.onChanged,
    required this.listTask,
    required this.onRemoved,
    Key? key,
  }) : super(key: key);
  final Function(bool?, int) onChanged;
  final List<Task> listTask;
  final Function(int) onRemoved;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (context, index) {
          final task = listTask[index];
          return TaskItemWidget(
            onDismissed: () => onRemoved(index),
            task: task,
            onChanged: (completed) => onChanged(
              completed,
              index,
            ),
          );
        },
      );
}
