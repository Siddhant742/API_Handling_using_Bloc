import 'dart:math';

import 'package:api_handling_using_bloc/model/Repository/Api/api.dart';
import 'package:api_handling_using_bloc/model/models/Todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  API api = API();

  Future<List<TodoModel>> fechRequests() async{
    try {
      Response response = await api.sendRequest.get('/todos');
      List<dynamic> TodoMaps = response.data;
      return TodoMaps.map((TodoMap) => TodoModel.fromJson(TodoMap)).toList();
    }
    catch (ex) {
      throw ex;
    }
  }
}