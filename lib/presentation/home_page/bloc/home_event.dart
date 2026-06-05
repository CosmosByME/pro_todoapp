part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchToDosEvent extends HomeEvent {}

final class CompleteToDoEvent extends HomeEvent {
  final ToDo toDo;

  const CompleteToDoEvent(this.toDo);

  @override
  List<Object> get props => [toDo];
}

final class UnCompleteToDoEvent extends HomeEvent {
  final ToDo toDo;

  const UnCompleteToDoEvent(this.toDo);

  @override
  List<Object> get props => [toDo];
}
