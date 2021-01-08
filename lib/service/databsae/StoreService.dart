import 'package:brainants_todoapp/model/Memo.dart';
import 'package:brainants_todoapp/service/authentication/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser;
  List<Todo> memoList;

  void addData(Todo todo) {
    _firebaseFirestore
        .collection(user.uid)
        .doc(todo.time)
        .set(todo.toJson())
        .then((value) => print("Success"));
  }

  Future<List<Todo>> getData() async {
    QuerySnapshot snapshot =
        await _firebaseFirestore.collection(user.uid).get();
    memoList = snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList();
    return memoList;
  }

  Stream<QuerySnapshot> get StreamData {
    return _firebaseFirestore.collection(user.uid).snapshots();
  }

  void delete(Todo todo) {
    _firebaseFirestore
        .collection(user.uid)
        .doc(todo.time)
        .delete()
        .then((_) => print("Deleted successfully"));
  }

  void update(Todo todo) {
    _firebaseFirestore
        .collection(user.uid)
        .doc(todo.time)
        .update(todo.toJson())
        .then((value) => print("Updated Succesfully"));
  }
}
