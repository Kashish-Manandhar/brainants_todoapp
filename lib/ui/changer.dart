import 'package:brainants_todoapp/model/user.dart';
import 'package:brainants_todoapp/service/databsae/StoreService.dart';
import 'package:brainants_todoapp/ui/HomePage.dart';
import 'package:brainants_todoapp/ui/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Changer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context, listen: true);
    return Scaffold(
      body: (user != null) ? HomePage() : Login(),
    );
  }
}
