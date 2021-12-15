import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news/model/user_model.dart';

class AuthController {
  void onLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  void onRegister(UserModel userModel) async {
    try {
      final users = FirebaseFirestore.instance.collection('users');

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password!);

      users
          .doc(userCredential.user!.uid)
          .set({"username": userModel.username, "email": userModel.email});

      print("----------------${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void sinOut() {
    FirebaseAuth.instance.signOut();
  }
}
