import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_todoapp/core/services/hive_service.dart';
import 'package:pro_todoapp/data/model/task_type.dart';
import 'package:pro_todoapp/data/model/to_do.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<FormSubmitted>((event, emit) {
      onFormSubmitted(event, emit);
    });
    on<TaskTypeChanged>((event, emit) {
      onTaskTypeChanged(event, emit);
    });
  }

  void onFormSubmitted(FormSubmitted event, Emitter<TodoState> emit) async {
    emit(TodoState(isLoading: true));

    final task = ToDo(
      title: event.title,
      description: event.description,
      day: event.day,
      time: event.time,
      taskType: event.taskType,
      isCompleted: false,
    );

    await HiveService().addTask(task);
    emit(TodoState(isLoading: false, isCompleted: true));

    await Future.delayed(const Duration(seconds: 1));
    emit(TodoState(isLoading: false, isCompleted: false));
  }

  void onTaskTypeChanged(TaskTypeChanged event, Emitter<TodoState> emit) {
    emit(TodoState(taskType: event.taskType));
  }
}
