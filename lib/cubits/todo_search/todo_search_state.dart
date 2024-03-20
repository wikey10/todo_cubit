part of 'todo_search_cubit.dart';

class TodoSearchCubitState extends Equatable{

  final String searchText;

  TodoSearchCubitState({
    required this.searchText
});

  factory TodoSearchCubitState.initial(){
    return TodoSearchCubitState(searchText: "");
}


  @override
  // TODO: implement props
  List<Object?> get props => [searchText];

  @override

  String toString() =>'TodoSearchCubitState(searchText: $searchText)';

  TodoSearchCubitState copywith({
    String? searchText
}){
    return TodoSearchCubitState(searchText: searchText ?? this.searchText);
  }


}
