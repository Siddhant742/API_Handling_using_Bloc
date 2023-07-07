import 'package:api_handling_using_bloc/controller/states/Todo_State.dart';
import 'package:api_handling_using_bloc/model/Repository/Todo_Repository.dart';
import 'package:api_handling_using_bloc/model/models/Todo_model.dart';
import 'package:bloc/bloc.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoRepository todoRepository = TodoRepository();
  TodoCubit() : super(TodoLoadingState());
  fetchRequests()async{
    try{
      List<TodoModel> Todos = await todoRepository.fechRequests();
      emit(TodoLoadedState(Todos));
    }
    catch(ex){
      emit(TodoErrorState(ex.toString()));
    }
  }

}