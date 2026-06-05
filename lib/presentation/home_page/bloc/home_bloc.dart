import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_todoapp/core/services/hive_service.dart';
import 'package:pro_todoapp/data/model/to_do.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchToDosEvent>((event, emit) {
      fetchToDos(event, emit);
    });
  }

  Future<void> fetchToDos(
    FetchToDosEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final completedTasks = HiveService().getCompletedTasks();
      final notCompletedTasks = HiveService().getNotCompletedTasks();
      emit(
        state.copyWith(
          notCompletedTodos: notCompletedTasks,
          completedTodos: completedTasks,
          isLoading: false,
        ),
      );
    } catch (e) {
      // Handle error case
      emit(state.copyWith(isLoading: false));
    }
  }

  void completeToDo(CompleteToDoEvent event, Emitter<HomeState> emit) {
    HiveService().completeTask(event.toDo.copyWith(isCompleted: true));
    emit(state.copyWith(
      notCompletedTodos: List.from(state.notCompletedTodos)..remove(event.toDo),
      completedTodos: List.from(state.completedTodos)..add(event.toDo),
    ));
  }

  void unCompleteToDo(UnCompleteToDoEvent event, Emitter<HomeState> emit) {
    HiveService().addTask(event.toDo.copyWith(isCompleted: false));
    emit(state.copyWith(
      notCompletedTodos: List.from(state.notCompletedTodos)..add(event.toDo),
      completedTodos: List.from(state.completedTodos)..remove(event.toDo),
    ));
  }
}
