part of 'todo_filter_cubit.dart';

class TodoFilterCubitState {
  final Filter filter;
  TodoFilterCubitState({
    required this.filter
});

  factory TodoFilterCubitState.initial(){
    return TodoFilterCubitState(filter: Filter.all);
  }


  @override
  List<Object> get props =>[filter];

  @override
  String toString() => "TodoFilterCubitState(filter:$filter)";

  TodoFilterCubitState copwith({
    Filter? filter,
}){
    return TodoFilterCubitState(filter: filter ?? this.filter);
  }
}
