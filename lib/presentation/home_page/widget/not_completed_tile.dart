import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todoapp/core/main_widgets/category_badges.dart';
import 'package:pro_todoapp/data/model/task_type.dart';
import 'package:pro_todoapp/data/model/to_do.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';

class NotCompletedTile extends StatefulWidget {
  final ToDo toDo;

  const NotCompletedTile({super.key, required this.toDo});

  @override
  State<NotCompletedTile> createState() => _NotCompletedTileState();
}

class _NotCompletedTileState extends State<NotCompletedTile> {
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
            color: widget.toDo.isCompleted ? Colors.grey : Colors.black87,
            decoration: widget.toDo.isCompleted
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            "${widget.toDo.day} | ${widget.toDo.time}",
            style: TextStyle(
              fontSize: 12,
              color: widget.toDo.isCompleted
                  ? Colors.grey.shade400
                  : Colors.grey,
              decoration: widget.toDo.isCompleted
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
        ),
        // Fix: Clean standard Checkbox bounded cleanly in size parameters
        trailing: Transform.scale(
          scale:
              1.1, // Gives a comfortable click feel from the design specification
          child: Checkbox(
            value: widget.toDo.isCompleted,
            activeColor: const Color(0xFF4A3780),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ), // Slightly square rounded edges
            ),
            onChanged: (newValue) {
              if (newValue == false) {
                context.read<HomeBloc>().add(UnCompleteToDoEvent(widget.toDo));
              } else {
                context.read<HomeBloc>().add(CompleteToDoEvent(widget.toDo));
              }
            },
          ),
        ),
      ),
    );
  }
}
