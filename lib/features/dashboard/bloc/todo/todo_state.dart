import 'package:demo_crypto_checker/core/network/network_model.dart';
import 'package:equatable/equatable.dart';
import '../../models/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class StandByTodoState extends TodoState {
  const StandByTodoState();

  @override
  List<Object?> get props => [Object()];
}

class LoadingTodoState extends TodoState {
  final ApiState state = ApiState.loading;

  const LoadingTodoState();

  @override
  List<Object?> get props => [state];
}

class LoadFailedTodoState extends TodoState {
  final ApiState state = ApiState.failed;
  final String errorMessage;

  const LoadFailedTodoState({required this.errorMessage});

  @override
  List<Object?> get props => [state, errorMessage];
}

class LoadSuccessTodoState extends TodoState {
  final ApiState state = ApiState.success;
  final List<TodoModel> items;

  const LoadSuccessTodoState({required this.items});

  @override
  List<Object?> get props => items;
}
