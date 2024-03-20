part of 'active_todo_cubit.dart';

class TodoActiveCountState extends Equatable{
  final int activeCount;
  TodoActiveCountState({
    required this.activeCount
});
  
  factory TodoActiveCountState.initial(){
    return TodoActiveCountState(activeCount: 0);
  }

  @override
  String toString()=> 'TodoActiveCountState(activeCount : $activeCount)';

  TodoActiveCountState copywith({
    int? activeTodoCount,
}){
    return TodoActiveCountState(activeCount: activeTodoCount ?? this.activeCount);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [activeCount];

}



