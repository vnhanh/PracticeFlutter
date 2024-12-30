
import 'package:demo_crypto_checker/core/network/api_service.dart';
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_event.dart';
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc of the feature.
///
/// Please review the sample code at here
/// https://github.com/dwyl/flutter-bloc-tutorial/blob/main/lib/bloc/todo_bloc.dart
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(StandByTodoState()) {
    on<LoadTodoEvent>(_onStart);
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  _onStart(TodoEvent event, Emitter<TodoState> emit) {
    emit(const LoadingTodoState());
  }

  _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is LoadSuccessTodoState) {
      emit(LoadSuccessTodoState(items: [...state.items, event.item]));
    }
  }

  _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is LoadSuccessTodoState) {
      final filterItems = state.items;
      filterItems.removeWhere((item) => item.id != event.item.id);
      emit(LoadSuccessTodoState(items: filterItems));
    }
  }
}
