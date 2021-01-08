import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/future.dart';
import 'package:brainants_todoapp/ui/input.dart';
import 'package:brainants_todoapp/ui/listMemo.dart';
import 'package:brainants_todoapp/ui/singletodo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    StoreService _store=StoreService();


    return Scaffold(
      appBar: AppBar(
        title: Text("To do List"),
        backgroundColor: Colors.green,
        actions: [
          FlatButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pop();
            },
            child: Text("Logout"),
          ),
        ],
      ),
      body: StreamProvider<List<Todo>>(create: (BuildContext context)=>_store.getStreamData(),
      child: FutureTodo(),),

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
