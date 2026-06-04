import 'package:flutter/material.dart';
import 'package:pro_todoapp/core/main_widgets/category_badges.dart';
import 'package:pro_todoapp/data/model/task_type.dart';
import 'package:pro_todoapp/data/model/to_do.dart';

class NotCompletedTile extends StatefulWidget {
  final ToDo toDo;

  const NotCompletedTile({
    super.key,
    required this.toDo,
  });

  @override
  State<NotCompletedTile> createState() => _NotCompletedTileState();
}

class _NotCompletedTileState extends State<NotCompletedTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: switch (widget.toDo.taskType) {
          TaskType.goal => GoalBadge(size: 48),
          TaskType.task => TaskBadge(size: 48),
          TaskType.event => EventBadge(size: 48),
        },
        title: Text(
          widget.toDo.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: value ? Colors.grey : Colors.black87,
            decoration: value ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            widget.toDo.description,
            style: TextStyle(
              fontSize: 12,
              color: value ? Colors.grey.shade400 : Colors.grey,
            ),
          ),
        ),
        // Fix: Clean standard Checkbox bounded cleanly in size parameters
        trailing: Transform.scale(
          scale: 1.1, // Gives a comfortable click feel from the design specification
          child: Checkbox(
            value: value,
            activeColor: const Color(0xFF4A3780),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Slightly square rounded edges
            ),
            onChanged: (newValue) {
              setState(() {
                value = newValue ?? false;
              });
            },
          ),
        ),
      ),
    );
  }
}