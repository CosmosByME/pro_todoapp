part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<ToDo> notCompletedTodos;
  final List<ToDo> completedTodos;
  final bool isLoading;
  const HomeState({
    this.notCompletedTodos = const [],
    this.completedTodos = const [],
    this.isLoading = false,
  });

  HomeState copyWith({
    List<ToDo>? notCompletedTodos,
    List<ToDo>? completedTodos,
    bool? isLoading,
  }) {
    return HomeState(
      notCompletedTodos: notCompletedTodos ?? this.notCompletedTodos,
      completedTodos: completedTodos ?? this.completedTodos,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [notCompletedTodos, completedTodos, isLoading];
}
