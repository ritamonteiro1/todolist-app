import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../domain/task.dart';
import '../../generated/l10n.dart';
import 'widgets/input_task_widget.dart';
import 'widgets/list_task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskTextEditingController = TextEditingController();
  List<Task> taskList = [];

  void addTask() {
    final newTask = Task(description: taskTextEditingController.text);
    taskList.add(newTask);
    taskTextEditingController.clear();
  }

  void updateStatusTask(int index, bool? isCompletedTask) {
    taskList[index].completed = isCompletedTask ?? false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(ConstantImages.logoIoasys),
              ),
              Text(S.of(context).homeScreenAppBarTitle),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 24, 17, 40),
              child: InputTaskWidget(
                  onPressed: () {
                    setState(addTask);
                  },
                  taskTextEditingController: taskTextEditingController,
                  textButton: S.of(context).homeScreenTextButton,
                  labelText: S.of(context).homeScreenNewTaskText),
            ),
            Expanded(
              child: ListTaskWidget(
                listTask: taskList,
                onChanged: (isCompletedTask, index) => setState(
                  () {
                    updateStatusTask(index, isCompletedTask);
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
