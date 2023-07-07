import '../../model/models/Todo_model.dart';

abstract class TodoState{}
class TodoLoadingState extends TodoState{}
class TodoLoadedState extends TodoState{
  List<TodoModel> todos ;
  TodoLoadedState(this.todos);
}
class TodoErrorState extends TodoState{
  String error;
  TodoErrorState(this.error);
}