import 'package:riverpod/riverpod.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:uuid/uuid.dart';



class ToDoListManeger extends StateNotifier<List<ToDoModel>> {
  ToDoListManeger(List<ToDoModel>? initialTodos) : super(initialTodos ?? []);

  void addToDo(String description) {
    var eklenecekToDo =
        ToDoModel(id: const Uuid().v4(), description: description);
    state = [...state, eklenecekToDo];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          ToDoModel(
              id: todo.id,
              description: todo.description,
              complated: !todo.complated)
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          ToDoModel(
              id: id, description: newDescription, complated: todo.complated)
        else
          todo
    ];
  }

  void remove(ToDoModel silinecekToDO) {
    state = state.where((element) => element.id != silinecekToDO.id).toList();
  }
  int onComplatedTodoCount(){
    return state.where((element) => !element.complated).length;
  }
}
