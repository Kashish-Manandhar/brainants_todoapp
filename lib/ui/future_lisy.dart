import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:flutter/material.dart';

import 'listMemo.dart';

class FutureList extends StatelessWidget {
  StoreService _store = StoreService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _store.getData(),
      builder: (_, data) {
        if (data.hasData) {
          List<Todo> todo = data.data;
          if (todo.length == 0) {
            return Center(
              child: Text("No data is here",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            );
          } else {
            return ListTodo(todo: todo);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
      },
    );
  }
}
