import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_cubit/Pages/createTodo_view.dart';
import 'package:todoapp_cubit/Pages/showTodo_view.dart';
import 'package:todoapp_cubit/cubits/allcubits.dart';

import 'todosearch_filter_view.dart';

class TodoPageView extends StatelessWidget {
  const TodoPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TodoHeader(),
              SizedBox(
                height: 5,
              ),
              CreateTodo(),
              SizedBox(
                height: 10,
              ),
              SearchAndFilterTodo(),
              SizedBox(
                height: 10,
              ),
              ShowTodosView()
            ],
          ),
        ),
      ),
    );
  }


}


class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("TODO",style: TextStyle(fontSize: 35),),
        //TwoMETHODS FOR value upations
        // Text("${context.watch<ActiveTodoCubit>().state.activeCount} ITEMS lefts",style: TextStyle(fontSize: 25,color: Colors.red),),
        BlocBuilder<ActiveTodoCubit,TodoActiveCountState>(builder: (context,state){
          return Text("${state.activeCount} ITEMS lefts",style: TextStyle(fontSize: 25,color: Colors.red),);
        })
      ],
    );
  }
}

