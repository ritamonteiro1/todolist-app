import 'package:flutter/material.dart';

class InputTaskWidget extends StatelessWidget {
  const InputTaskWidget({
    required this.taskTextEditingController,
    required this.onPressed,
    required this.labelText,
    required this.textButton,
    Key? key,
  }) : super(key: key);
  final TextEditingController taskTextEditingController;
  final Function()? onPressed;
  final String labelText;
  final String textButton;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskTextEditingController,
              decoration: InputDecoration(
                labelText: labelText,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
            ),
          ),
        ],
      );
}
