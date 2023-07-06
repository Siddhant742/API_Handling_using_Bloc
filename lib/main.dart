import 'dart:math';

import 'package:api_handling_using_bloc/model/Repository/Todo_Repository.dart';
import 'package:api_handling_using_bloc/model/models/Todo_model.dart';
import 'package:api_handling_using_bloc/view/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  TodoRepository todoRepository = TodoRepository();
  List<TodoModel> TodoModels = await todoRepository.fechRequests()  ;
  print(TodoModels);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

