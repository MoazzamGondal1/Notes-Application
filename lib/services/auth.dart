import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/Models/MyUser.dart';

class AuthService {

  final FirebaseAuth _auth=FirebaseAuth.instance;

  My_User? _userFromFirebaseUser(User? user){
    return user !=null ? My_User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<My_User?> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }


  //sign in anon
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and password
  Future registerWithEmailPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign out
Future sign_Out() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}