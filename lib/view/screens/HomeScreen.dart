import 'package:api_handling_using_bloc/controller/cubits/Todo_Cubit.dart';
import 'package:api_handling_using_bloc/controller/states/Todo_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Handling'),
      ),
      body:BlocConsumer<TodoCubit, TodoState>(
        listener: (context,state){
          if(state is TodoErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString()),
            backgroundColor: Colors.red,));
          }
        },
          builder: (context,state){
        if(state is TodoLoadingState){
          return Center(child:CircularProgressIndicator(),);
        }
        else if (state is TodoLoadedState){
          return buildListView(state);
        }
        return Center(child: Text('An error occured'));
      }),
    );
  }

  ListView buildListView(TodoLoadedState state) {
    return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (BuildContext context, int index){
            var todo = state.todos[index];
          return ListTile(
            title: Text(todo.id.toString()),
            subtitle: Text(todo.title.toString()),
          );
        },
        );
  }
}
