import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/providers/all_providers.dart';

class ToDoListItemWidget extends ConsumerStatefulWidget {
  ToDoModel item;
   ToDoListItemWidget({super.key,required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoListItemWidgetState();
}

class _ToDoListItemWidgetState extends ConsumerState<ToDoListItemWidget> {

  late FocusNode _textFocusNode;
  late TextEditingController _textEditingController;
  bool _hasFocus=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFocusNode=FocusNode();
    _textEditingController=TextEditingController();
  }
  void dispose(){
    _textFocusNode.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Focus(
      onFocusChange: (isFocused)=>{
        setState(() {
          if(!isFocused){
            _hasFocus=false;

          }
          ref.read(todoListProvider.notifier).edit(id: widget.item.id, newDescription: _textEditingController.text);
          
          
        })
      },
      child: ListTile(
        onTap: (){
          setState(() {
            _hasFocus=true;
            _textFocusNode.requestFocus();
            _textEditingController.text=widget.item.description;
            
          });
          
        },
        leading: Checkbox(value: widget.item.complated,onChanged: (value){
          ref.read(todoListProvider.notifier).toggle(widget.item.id);
      
        },),
        title:_hasFocus?  TextField(controller: _textEditingController,focusNode: _textFocusNode,):Text(widget.item.description),
      ),
    );
  }
}
