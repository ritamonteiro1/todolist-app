import 'package:flutter/material.dart';
import 'package:todolistapp/domain/task.dart';
import '../constants/constant_images.dart';
import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> list = [
    Task(description: 'comprar leite'),
    Task(description: 'comprar ovos'),
  ];

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
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final task = list[index];
                  return CheckboxListTile(
                    value: task.completed,
                    onChanged: (value) {
                      setState(() {
                        task.completed = value ?? false;
                      });
                    },
                    title: Text(task.description),
                    secondary: const Icon(Icons.check_circle),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
