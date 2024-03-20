import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

enum Filter{
  all,
  active,
  completed
}


class TodoModel extends Equatable{

  final String id;
  String description;
  bool completed;

TodoModel({
    String? id,
    required this.description,
  this.completed =false,
}) : this.id = id ??uuid.v4();

  @override
  // TODO: implement props
  List<Object?> get props => [id,description,completed];


  @override
  String toString()=> 'TodoModel(id:$id,description :$description,completed:$completed)';
}