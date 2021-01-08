import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:flutter/material.dart';

import 'input.dart';

class SingleTodo extends StatefulWidget {
  Todo todo;

  SingleTodo({this.todo});

  @override
  _SingleTodoState createState() => _SingleTodoState();
}

class _SingleTodoState extends State<SingleTodo> {
  StoreService _store = StoreService();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          "${widget.todo.task}",
          style: TextStyle(
              fontSize: 18,
              decoration: (widget.todo.isChecked == true)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
          textAlign: TextAlign.center,
        ),
        leading: Checkbox(
          value: widget.todo.isChecked,
          onChanged: (bool value) {
            setState(() {
              widget.todo.isChecked = value;
              _store.update(widget.todo);
            });
          },

          activeColor: Colors.greenAccent,
        ),
        subtitle: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            FlatButton.icon(
                onPressed: () {
                  _store.delete(widget.todo);
                },
                icon: Icon(
                  Icons.delete,
                ),
                label: Text("")),
            FlatButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => Input(
                            todo: widget.todo,
                            i: 1,
                          ));
                },
                icon: Icon(Icons.edit),
                label: Text(""))
          ],
        ));
  }
}
