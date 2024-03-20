import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterCubitState> {
  TodoFilterCubit() : super(TodoFilterCubitState.initial());

 void changeFilter(Filter newfilter){
   emit(state.copwith(filter:newfilter));
 }

}
