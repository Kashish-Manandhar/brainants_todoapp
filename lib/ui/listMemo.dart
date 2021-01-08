import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/singletodo.dart';
import 'package:flutter/material.dart';

import 'input.dart';
class ListTodo extends StatefulWidget {
  List<Todo> todo;

  ListTodo({this.todo});

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  StoreService _store=new StoreService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, position) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color:Colors.blueGrey,width: 2)

            ),
          child:SingleTodo(todo: widget.todo[position],)
        );
      },
      itemCount: widget.todo.length,
    );
  }
}
