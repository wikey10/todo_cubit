import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_cubit/Pages/debounce.dart';
import 'package:todoapp_cubit/cubits/allcubits.dart';
import 'package:todoapp_cubit/models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
   SearchAndFilterTodo({super.key});

   final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Search TODO",
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search)
          ),
          onChanged: (String? newSearch){
            if(newSearch!=null){
              debounce.run(() {
                context.read<TodoSearchCubit>().setSearchTerm(newSearch);
              });

            }
          },
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context,Filter.all),
            filterButton(context,Filter.active),
            filterButton(context,Filter.completed),
          ],
        )

      ],
    );
  }

  filterButton(BuildContext context,Filter filter){
    return TextButton(onPressed: (){
      context.read<TodoFilterCubit>().changeFilter(filter);
    }, child: Text(
      filter ==Filter.all
          ?"All"
          :filter ==Filter.completed
          ?"Completed"
          :"Active",
      style: TextStyle(
        fontSize: 16,
        color: textColor(context, filter)
      ),
    ));
  }

  Color textColor(BuildContext context,Filter filter){
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter? Colors.blue : Colors.grey;
  }
}
