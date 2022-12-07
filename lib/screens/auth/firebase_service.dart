import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/result.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Result<UserCredential, String>> signInService(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
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
      final userCredential = await auth.createUserWithEmailAndPassword(
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
    auth.signOut();
  }

  User currentUser() {
    return auth.currentUser!;
  }

  Future<void> setMovie(Movie movie) async {
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(movie.title)
        .set({"watchMovie": movie.toJson()})
        .onError((e, _) => print("Error writing document: $e"));
  }

  Future<void> deleteMovie(Movie movie) async {
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(movie.title)
        .delete();
  }
}