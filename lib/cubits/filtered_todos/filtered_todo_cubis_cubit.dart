import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todoapp_cubit/cubits/todo_search/todo_search_cubit.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

import '../todo_lists/todo_lists_cubit.dart';

part 'filtered_todo_cubis_state.dart';

class FilteredTodoCubisCubit extends Cubit<FilteredTodoState> {

  late final FilteredTodoCubisCubit todoCubisCubit;
  late final TodoSearchCubit todoSearchCubit;
  late  final TodoListsCubit todoListsCubit;
  late final TodoFilterCubit todoFilterCubit;

  final List<TodoModel> initialTodos;

  late final StreamSubscription toFilterSubscription;
  late final StreamSubscription toSearchSubscription;
  late final StreamSubscription toListSubscription;


  FilteredTodoCubisCubit({
    required this.initialTodos,
    required this.todoListsCubit,
    required this.todoSearchCubit,
    required this.todoFilterCubit
}) : super(FilteredTodoState(filteredTodos: initialTodos)){
    toFilterSubscription = todoFilterCubit.stream.listen((TodoFilterCubitState todoFilterCubitState) {
      setFilteredTodos();
    });
    toSearchSubscription = todoSearchCubit.stream.listen((TodoSearchCubitState todoSearchCubitState) {
      setFilteredTodos();
    });
    toListSubscription = todoListsCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos(){
    List<TodoModel> _filteredTodos;

    switch(todoFilterCubit.state.filter){
      case Filter.active : _filteredTodos = todoListsCubit.state.todos
          .where((TodoModel todoModel) => !todoModel.completed).toList();
      break;
      case Filter.completed : _filteredTodos = todoListsCubit.state.todos
          .where((TodoModel todoModel) => todoModel.completed).toList();
      break;
      case Filter.all : _filteredTodos = todoListsCubit.state.todos;
      break;
    }

    if(todoSearchCubit.state.searchText.isNotEmpty){
      _filteredTodos = _filteredTodos.where((TodoModel todoModel) => todoModel.description.toLowerCase().contains(todoSearchCubit.state.searchText)).toList();
    }
    emit(state.copywith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    toListSubscription.cancel();
    toSearchSubscription.cancel();
    toFilterSubscription.cancel();
    return super.close();
  }


}
