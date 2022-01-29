import 'package:flutter/material.dart';

import '../constants/constant_images.dart';
import '../domain/task.dart';
import '../generated/l10n.dart';
import 'widgets/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditingController = TextEditingController();
  List<Task> list = [
    Task(description: 'comprar leite'),
    Task(description: 'comprar ovos'),
  ];

  void addTask() {
    final newTask = Task(description: textEditingController.text);
    list.add(newTask);
    textEditingController.clear();
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
            Text(S.of(context).homeScreenAddText),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 24, 17, 40),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          labelText: S.of(context).homeScreenNewTaskText),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(addTask);
                    },
                    child: Text(
                      S.of(context).homeScreenTextButton,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final task = list[index];
                  return TaskItemWidget(
                    task: task,
                    onChanged: (value) {
                      setState(() {
                        task.completed = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
}
