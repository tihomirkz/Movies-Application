import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/screens/auth/utils/utils.dart';

class FirebaseService {
  Future<void> signInService(TextEditingController email, TextEditingController password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future<void> signUpService(TextEditingController email, TextEditingController password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      Utils.showSnackBar(e.message);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  User currentUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}