import 'package:flutter/material.dart';

class TaskTitleField extends StatelessWidget {
  final TextEditingController? controller;
  const TaskTitleField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Task Title",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Task Title",
          ),
        ),
      ],
    );
  }
}
