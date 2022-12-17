import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart' as u;

class UserService{

   FirebaseAuth _auth = FirebaseAuth.instance;
  creteUser(u.User user,String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.email!, password: password);
       } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  signOut()async{
    return await _auth.signOut();
  }

}