part of 'todo_lists_cubit.dart';

class TodoListState extends Equatable{
  final List<TodoModel> todos;
  TodoListState({
    required this.todos
});

  factory TodoListState.initial(){
    return TodoListState(todos: [
      TodoModel(description: "Clean the rooms",
        id: "1"
      ),
      TodoModel(description: "Wash the dish",
          id: "2"
      ),
      TodoModel(description: "Do Homework",
          id: "3"
      ),
    ]);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [todos];

  @override
  String toString() => 'TodoListState(todos:$todos)';

  TodoListState copywith({
    List<TodoModel>? todos
}){
    return TodoListState(todos: todos?? this.todos);
  }

}
