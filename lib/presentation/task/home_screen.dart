import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/constant_images.dart';
import '../../domain/use_case/add_task_use_case.dart';
import '../../domain/use_case/remove_task_use_case.dart';
import '../../domain/use_case/update_status_task_use_case.dart';
import '../../generated/l10n.dart';
import 'home_store.dart';
import 'task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskTextEditingController = TextEditingController();
  late AddTaskUseCase addTaskUseCase;
  late RemoveTaskUseCase removeTaskUseCase;
  late UpdateStatusTaskUseCase updateStatusTaskUseCase;
  late HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    addTaskUseCase = AddTaskUseCase();
    removeTaskUseCase = RemoveTaskUseCase();
    updateStatusTaskUseCase = UpdateStatusTaskUseCase();
    homeStore = HomeStore(
      addTaskUseCase,
      removeTaskUseCase,
      updateStatusTaskUseCase,
    );
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      onChanged: homeStore.setTypedTaskDescription,
                      controller: taskTextEditingController,
                      decoration: InputDecoration(
                          labelText: S.of(context).homeScreenNewTaskText),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (context) => Container(
                        child: homeStore.isFilledDescriptionTaskField
                            ? TextButton(
                                child: Text(S.of(context).homeScreenTextButton),
                                onPressed: () {
                                  homeStore
                                      .addTask(taskTextEditingController.text);
                                  taskTextEditingController.clear();
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(
                  builder: (context) => ListView.builder(
                        itemCount: homeStore.taskList.length,
                        itemBuilder: (context, clickedTaskIndex) {
                          final task = homeStore.taskList[clickedTaskIndex];
                          return TaskItemWidget(
                            confirmDismiss: () =>
                                _showAlertDialog(clickedTaskIndex),
                            task: task,
                            onChanged: (isCompletedTask) {
                              homeStore.updateTask(
                                  clickedTaskIndex, isCompletedTask);
                            },
                          );
                        },
                      )),
            ),
          ],
        ),
      );

  void _showAlertDialog(int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(S.of(context).messageAlertTitle),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(S.of(context).alertDialogNegativeButton),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        homeStore.removeTask(index);
                      },
                      child: Text(S.of(context).alertDialogPositiveButton),
                    ),
                  ],
                ),
              ],
            ));
  }
}
