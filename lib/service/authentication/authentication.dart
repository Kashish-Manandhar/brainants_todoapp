import 'package:brainants_todoapp/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  FirebaseAuth _auth=FirebaseAuth.instance;

  Future createUser(String email,String password) async{

    try{

      final new_user=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(new_user.user);
}
    catch(e)
    {
      print(e);
      return null;
    }
  }


  Future signInUser(String email,String password) async {
    try {
      final new_user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(new_user.user);
    }
    catch (e) {
      print(e);
      return null;
    }
  }

  AppUser _userFromFirebase(User user){
    return (user!=null) ? AppUser(uid: user.uid) : null;
  }

    Stream<AppUser> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebase);
    }


  Future signOut() async{
    try{
      final result=await _auth.signOut();

    }
    catch(e)
    {
      print(e);
    }
  }






}



