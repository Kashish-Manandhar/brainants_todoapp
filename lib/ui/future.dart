import 'package:brainants_todoapp/model/Memo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'listMemo.dart';
class FutureTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<List<Todo>> initisateList(BuildContext context) async {
      print(context);
      return Provider.of<List<Todo>>(context,listen: true);
    }

    return Container(
        child: FutureBuilder<List<Todo>>(
          future: initisateList(context),
          builder: (_, snapshot) {

            print(snapshot);

            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              List<Todo> list = snapshot.data;
              print(list.toString());

              if (list.length == 0) {
                return Center(
                  child: Text("NO DATA UPLAODED TILL NOW"),
                );
              } else {
                return ListTodo(todo: list);
              }


            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlue,
                ),
              );


            }
          },
        ));

  }
}
