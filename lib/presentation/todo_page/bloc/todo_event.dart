part of 'todo_bloc.dart';


sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitted extends TodoEvent {
  final String title;
  final String description;
  final String day;
  final String time;
  final TaskType taskType;

  const FormSubmitted({
    required this.title,
    required this.description,
    required this.day,
    required this.time,
    required this.taskType,
  });
}

class TaskTypeChanged extends TodoEvent {
  final TaskType taskType;

  const TaskTypeChanged(this.taskType);
}
