import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';
import 'todo_list_manager.dart';

final todoListProvider =
    StateNotifierProvider<ToDoListManeger, List<ToDoModel>>(
        (ref) => ToDoListManeger([
              ToDoModel(id: Uuid().v4(), description: "Spora Git"),
              ToDoModel(id: Uuid().v4(), description: "Ders Çalış"),
              ToDoModel(id: Uuid().v4(), description: "Alışveriş Yap"),
              ToDoModel(id: Uuid().v4(), description: "Tv izle")
            ]));