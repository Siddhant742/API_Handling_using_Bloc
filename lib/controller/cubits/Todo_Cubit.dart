import 'package:api_handling_using_bloc/controller/states/Todo_State.dart';
import 'package:api_handling_using_bloc/model/Repository/Todo_Repository.dart';
import 'package:api_handling_using_bloc/model/models/Todo_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoRepository todoRepository = TodoRepository();
  TodoCubit() : super(TodoLoadingState()){fetchTodos();}
  fetchTodos()async{
    try{
      List<TodoModel> Todos = await todoRepository.fechRequests();
      emit(TodoLoadedState(Todos));
    }
    on DioException catch(ex){
      if(ex.type == DioExceptionType.unknown){
        emit(TodoErrorState('Can\'t fetch data. Please check your internet connection!' ));
      }
      else
      emit(TodoErrorState(ex.type.toString()));
    }
  }

}