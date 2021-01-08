import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/input.dart';
import 'package:brainants_todoapp/ui/listMemo.dart';
import 'package:brainants_todoapp/ui/singletodo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Future<List<Todo>> initisateList(BuildContext context) async {
    return await Provider.of<List<Todo>>(context);
  }

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text("To do List"),
        backgroundColor: Colors.green,
        actions: [
          FlatButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("Logout"),
          ),
        ],
      ),
      body: Container(
          child: FutureBuilder(
        future: initisateList(context),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            List<Todo> list = snapshot.data;

            if (list.length == 0) {
              return Center(
                child: Text("NO DATA UPLAODED TILL NOW"),
              );
            } else {
              return ListTodo(todo: snapshot.data);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlue,
              ),
            );
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => Input(
                    todo: null,
                    i: 0,
                  ));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
