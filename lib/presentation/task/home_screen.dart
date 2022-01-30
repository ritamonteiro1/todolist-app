import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/task.dart';
import '../../domain/use_case/add_task_use_case.dart';
import '../../domain/use_case/remove_task_use_case.dart';
import '../../domain/use_case/update_status_task_use_case.dart';
import '../../generated/l10n.dart';
import 'home_controller.dart';
import 'input_task_widget.dart';
import 'list_task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AddTaskUseCase addTaskUseCase;
  late RemoveTaskUseCase removeTaskUseCase;
  late UpdateStatusTaskUseCase updateStatusTaskUseCase;
  late HomeController homeController;
  late List<Task> listTask;
  late TextEditingController taskTextEditingController;

  @override
  void initState() {
    super.initState();
    addTaskUseCase = AddTaskUseCase();
    removeTaskUseCase = RemoveTaskUseCase();
    updateStatusTaskUseCase = UpdateStatusTaskUseCase();
    listTask = [];
    homeController = HomeController(
      addTaskUseCase,
      removeTaskUseCase,
      updateStatusTaskUseCase,
      listTask,
    );
    taskTextEditingController = TextEditingController();
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
                    setState(() {
                      homeController.addTask(taskTextEditingController.text);
                      taskTextEditingController.clear();
                    });
                  },
                  taskTextEditingController: taskTextEditingController,
                  textButton: S.of(context).homeScreenTextButton,
                  labelText: S.of(context).homeScreenNewTaskText),
            ),
            Expanded(
              child: ListTaskWidget(
                onRemoved: (index) {
                  setState(() {
                    homeController.removeTask(index);
                  });
                },
                listTask: homeController.taskList,
                onChanged: (isCompletedTask, index) => setState(
                  () {
                    homeController.updateTask(index, isCompletedTask);
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
