import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchCubitState> {
  TodoSearchCubit() : super(TodoSearchCubitState.initial());

 void setSearchTerm(String newSearchText){
   emit(state.copywith(searchText: newSearchText));
 }


}
