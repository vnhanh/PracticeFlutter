
import 'package:demo_crypto_checker/core/network/api_service.dart';
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_event.dart';
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_state.dart';
import 'package:demo_crypto_checker/features/dashboard/repositories/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Bloc of the feature.
///
/// Please review the sample code at here
/// https://github.com/dwyl/flutter-bloc-tutorial/blob/main/lib/bloc/todo_bloc.dart
///
/// https://stackoverflow.com/questions/58898985/flutter-bloc-multiple-repositories-per-bloc-or-only-one
@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(StandByTodoState()) {
    on<LoadTodoEvent>(_onStart);
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  _onStart(TodoEvent event, Emitter<TodoState> emit) async {
    emit(const LoadingTodoState());
    try {
      final listOfTodoItems = await _repository.getListOfItems(123);
      emit(LoadSuccessTodoState(items: listOfTodoItems));
    } catch (e) {
      print(e);
      String errMsg = e.toString();
      if (errMsg.isEmpty) errMsg = 'Failed to load data';
      emit(LoadFailedTodoState(errorMessage: errMsg));
    }
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
