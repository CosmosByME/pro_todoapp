part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class FormSubmitted extends TodoEvent {
  final String title;
  final String description;
  final String day;
  final String time;
  final TaskType taskType;

  FormSubmitted({
    required this.title,
    required this.description,
    required this.day,
    required this.time,
    required this.taskType,
  });
}

class TaskTypeChanged extends TodoEvent {
  final TaskType taskType;

  TaskTypeChanged(this.taskType);
}
