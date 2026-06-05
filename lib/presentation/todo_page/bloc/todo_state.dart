part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final TaskType taskType;
  final bool isLoading;
  final bool isCompleted;

  const TodoState({
    this.taskType = TaskType.event,
    this.isLoading = false,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [
    taskType,
    isLoading,
    isCompleted,
  ];
}
