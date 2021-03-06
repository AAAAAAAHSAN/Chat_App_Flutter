import 'package:chat_app_flutter/module/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser _userFromFirebaseUser(FirebaseUser user){
    return user!=null ? MyUser(userId: user.uid): null;
  }

  Future signInWithEmailAndPassword(String email, String password) async
  {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async
  {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future resetPassword(String email) async
  {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}