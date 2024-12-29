
import 'package:demo_crypto_checker/features/dashboard/bloc/todo/todo_bloc.dart';
import 'package:flutter/foundation.dart';

/// Class defines properties of a TODO item
///
/// @param id valid if it's not null. Otherwise, it's invalid, should ignore.
@immutable
class TodoModel {
  final int? id;
  final String title;
  final String description;
  final int timeStamp;
  final TodoState state;

  const TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timeStamp,
    required this.state
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    final itemId = map['id'] as int?;

    final stateResponse = map['state'] as int? ?? -1;
    final state = TodoState.fromInt(stateResponse);
    return TodoModel(
        id: itemId,
        title: map['title'] as String,
        description: map['description'] as String,
        timeStamp: map['timeStamp'] as int,
        state: state,
    );
  }
}

enum TodoState {
  undefined(-1), idle(0), inProgress(1), done(2), suspend(3), cancelled(4);

  final int value;
  const TodoState(this.value);

  factory TodoState.fromInt(int value) {
    if (value < 0 || value >= values.length) return TodoState.undefined;
    final bloc = TodoBloc();
    return values[value];
  }
}

// extension EnumExtension<T> on int {
//   T? toEnum(List<T> values) {
//     if (this < 0 || this >= values.length) return null;
//     return values[this];
//   }
// }
