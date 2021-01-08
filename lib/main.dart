import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/HomePage.dart';
import 'package:brainants_todoapp/ui/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthService _authService = AuthService();
  StoreService _store = StoreService();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Login()),
    );
  }
}
