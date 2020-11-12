import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUseByUsername(String username)
  {

  }
  uploadUserInfo(userMap)
  {
    Firestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
    
  }

}
