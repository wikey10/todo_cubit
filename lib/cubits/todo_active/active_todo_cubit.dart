import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_cubit/cubits/todo_lists/todo_lists_cubit.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

part 'active_todo_state.dart';

class ActiveTodoCubit extends Cubit<TodoActiveCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListsCubit todoListsCubit;

  ActiveTodoCubit({
    required this.initialActiveTodoCount,
    required this.todoListsCubit,

}) : super(TodoActiveCountState(activeCount: initialActiveTodoCount)){
    todoListSubscription = todoListsCubit.stream.listen((TodoListState todoListState){
      print("todoListState: $todoListState");

      final int currentActiveTodoCount = todoListState.todos
      .where((TodoModel todoModel)=> !todoModel.completed).toList().length;
      emit(state.copywith(activeTodoCount: currentActiveTodoCount));
    } );
  }

  @override
  Future<void> close()async {
    todoListSubscription.cancel();
    return super.close();
  }


}
