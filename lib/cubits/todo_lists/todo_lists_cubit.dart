import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

part 'todo_lists_state.dart';

class TodoListsCubit extends Cubit<TodoListState> {
  TodoListsCubit() : super(TodoListState.initial());


  void addTodo(String todoDesc){
    final newTodo=TodoModel(description: todoDesc);
    final newTodos= [...state.todos,newTodo];

    emit(state.copywith(todos: newTodos));
    print(state);

  }

  void editTodo(String id, String todoDesc){
    final newTodos= state.todos.map((TodoModel todo){
      if(todo.id==id){
        return TodoModel(
            id: id,
            description: todoDesc,
            completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copywith(todos: newTodos));
  }

  void toggleTodo(String id){
    final newTodos = state.todos.map((TodoModel todoModel) {
      if(todoModel.id==id){
        return TodoModel(description: todoModel.description,
            completed: !todoModel.completed,
            id: id
        );
      }
      return todoModel;
    }).toList();
    emit(state.copywith(todos: newTodos));
  }

  void removeTodo(TodoModel todoModel){
    final newTodos = state.todos.where((TodoModel t) =>t.id!=todoModel.id)
        .toList();
    emit(state.copywith(todos: newTodos));
  }

}
