import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todolist/providers/all_providers.dart';
import 'package:todolist/widgets/title_widget.dart';
import 'package:todolist/widgets/todo_list_item_widget.dart';
import 'package:todolist/widgets/toolbar_widget.dart';


class TodoApp extends ConsumerWidget {
  
  TodoApp({super.key});
  final newToDoController = TextEditingController();
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var allTodoS=ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const TitleWidget(),
            TextField(
              controller: newToDoController,
              decoration:
                  const InputDecoration(labelText: "Neler Yapacaksın Bugün?"),
              onSubmitted: (newToDo) {
                ref.read(todoListProvider.notifier).addToDo(newToDo);
                debugPrint("şunu ekle $newToDo");
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const ToolBarWidget(),
            for (int i = 0; i < allTodoS.length; i++)
              Dismissible(
                key:ValueKey(allTodoS[i].id),
                onDismissed: (_){
                  ref.read(todoListProvider.notifier).remove(allTodoS[i]);

                },
                  
                  child: ToDoListItemWidget(item: allTodoS[i]))
          ]),
    );
  }
}
