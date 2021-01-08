import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/future_lisy.dart';
import 'package:brainants_todoapp/ui/input.dart';
import 'package:brainants_todoapp/ui/listMemo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    StoreService _store = StoreService();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To do List"
        ),
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
        child: StreamBuilder(
          stream: _store.StreamData,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return FutureList();
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlue,
                ),
              );
            }
          },
        ),
      ),
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
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}
