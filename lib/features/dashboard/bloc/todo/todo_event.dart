import 'package:demo_crypto_checker/core/network/network_model.dart';
import 'package:demo_crypto_checker/features/dashboard/models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodoEvent extends TodoEvent {
  final ApiState state = ApiState.loading;

  const LoadTodoEvent();

  @override
  List<Object?> get props => [state];
}

class AddTodoEvent extends TodoEvent {
  final TodoModel item;

  const AddTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class RemoveTodoEvent extends TodoEvent {
  final TodoModel item;

  const RemoveTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class StartTodoEvent extends TodoEvent {
  final TodoModel item;
  const StartTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class DoneTodoEvent extends TodoEvent {
  final TodoModel item;
  const DoneTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class SuspendTodoEvent extends TodoEvent {
  final TodoModel item;
  const SuspendTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class CancelTodoEvent extends TodoEvent {
  final TodoModel item;
  const CancelTodoEvent({required this.item});

  @override
  List<Object?> get props => [item];
}
