part of 'filtered_todo_cubis_cubit.dart';

class FilteredTodoState extends Equatable {

  final List<TodoModel> filteredTodos;

  FilteredTodoState({
    required this.filteredTodos
});

  factory FilteredTodoState.initial(){
    return FilteredTodoState(filteredTodos: []);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filteredTodos];

  @override
  String toString()=> 'FilteredTodoState(filteredTodos: $filteredTodos)';
  
  FilteredTodoState copywith({
    List<TodoModel>? filteredTodos,
}){
    return FilteredTodoState(filteredTodos: filteredTodos ?? this.filteredTodos);
  }

}
