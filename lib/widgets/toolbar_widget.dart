import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int onComplatedTodoCount=ref.watch(todoListProvider).where((element) => !element.complated).length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Expanded(child: Text("${onComplatedTodoCount.toString()} görev var")),
      Tooltip(
        message: "Tüm görevler",
        child: TextButton(onPressed: (){},child: Text("All"),),
      ),
      Tooltip(
        message: "Tamamlanmamış Görev",
        child: TextButton(onPressed: (){},child: Text("Active"),),
      ),
      Tooltip(
        message: "Tamamlanmış Görev",
        child: TextButton(onPressed: (){},child: Text("Complated"),),
      ),
      
    ],);
  }
}