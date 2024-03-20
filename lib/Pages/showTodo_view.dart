import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_cubit/Pages/debounce.dart';
import 'package:todoapp_cubit/cubits/allcubits.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

class ShowTodosView extends StatelessWidget {
   ShowTodosView({super.key});



  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodoCubisCubit>().state.filteredTodos;
    return ListView.separated(
        shrinkWrap: true ,
      itemCount: todos.length,
        primary: false,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.grey);
        },
        itemBuilder: (BuildContext context,int index){
      return Dismissible(
        key: ValueKey(todos[index].id),
        background: showBackGround(0),
        secondaryBackground:showBackGround(1) ,
        child: TodoItem(todoModel: todos[index]),
        onDismissed: (_){
          context.read<TodoListsCubit>().removeTodo(todos[index]);
        },
        confirmDismiss: (_) {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you really want to delete?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('NO'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('YES'),
                  ),
                ],
              );
            },
          );
        },
      );
    },

        );
  }


  showBackGround(int direction){
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.red,
      alignment: direction ==0? Alignment.centerLeft
      :Alignment.centerRight
      ,
      child: Icon(
        Icons.delete,
        color: Colors.white,
        size: 35,
      ),
    );
  }
  
}


class TodoItem extends StatefulWidget {
  final TodoModel todoModel;
  const TodoItem({
    Key? key,required this.todoModel
}):super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showDialog(context: context, builder: (context){
          bool errors=false;
          textEditingController.text =widget.todoModel.description;
          return StatefulBuilder(builder: (BuildContext context,StateSetter setstate){
            return AlertDialog(
              title: Text("Edit TODO"
              ),
              content: TextFormField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  errorText: errors ?"Values cannot be changes" : null,
                ),
              ),
              actions: [
                TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
                TextButton(onPressed: (){
                  setState(() {
                    errors = textEditingController.text.isEmpty
                        ?true
                        :false;
                    if(!errors){
                      context.read<TodoListsCubit>().editTodo(widget.todoModel.id, textEditingController.text);
                      Navigator.pop(context);
                    }
                  });
                }, child: Text("Edit")),
              ],
            );
          });
        });
      },
      leading: Checkbox(
        value: widget.todoModel.completed, onChanged: (bool? value) { 
          context.read<TodoListsCubit>().toggleTodo(widget.todoModel.id);
      },),
      title: Text(widget.todoModel.description),
    );
  }
}

