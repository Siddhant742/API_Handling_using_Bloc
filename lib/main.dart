import 'dart:math';

import 'package:api_handling_using_bloc/controller/cubits/Todo_Cubit.dart';
import 'package:api_handling_using_bloc/controller/states/Todo_State.dart';
import 'package:api_handling_using_bloc/model/Repository/Todo_Repository.dart';
import 'package:api_handling_using_bloc/model/models/Todo_model.dart';
import 'package:api_handling_using_bloc/view/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  // TodoRepository todoRepository = TodoRepository();
  // List<TodoModel> TodoModels = await todoRepository.fechRequests()  ;
  // print(TodoModels);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (BuildContext context) => TodoCubit() ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

