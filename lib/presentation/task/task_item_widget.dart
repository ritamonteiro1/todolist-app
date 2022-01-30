import 'package:flutter/material.dart';
import '../../domain/model/task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    required this.task,
    required this.onChanged,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);
  final Task task;
  final Function(bool?) onChanged;
  final Function() onDismissed;

  @override
  Widget build(BuildContext context) => Dismissible(
        onDismissed: (_) {
          onDismissed();
        },
        key: Key(
          DateTime.now().microsecondsSinceEpoch.toString(),
        ),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: const Align(
            alignment: Alignment(-0.9, 0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        child: CheckboxListTile(
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
        ),
      );
}
