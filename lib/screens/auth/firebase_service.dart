import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_application/screens/auth/result.dart';

class FirebaseService {
  Future<Result<UserCredential, String>> signInService(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential);
    } on FirebaseAuthException catch(e) {
      return Result.error(e.message);
    }
  }

  Future<Result<UserCredential, String>> signUpService(String email, String password,
      String displayName) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(displayName);
      return Result.success(userCredential);
    } on FirebaseAuthException catch(e) {
      return Result.error(e.message);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  User currentUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}