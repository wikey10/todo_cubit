import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_cubit/cubits/allcubits.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTodoController = TextEditingController();


  @override
  void dispose() {
    newTodoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: newTodoController,
      decoration: InputDecoration(
        labelText: "What to do?"
      ),
      onFieldSubmitted: (String? todoDesc){
        if(todoDesc !=null && todoDesc.trim().isNotEmpty){
          context.read<TodoListsCubit>().addTodo(todoDesc);
          newTodoController.clear();
        }
      },
    );
  }
}
