import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/result.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Movie> watchMoviesList = [];

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
    await db.collection(auth.currentUser!.email.toString())
        .doc(movie.title)
        .set(movie.toJson())
        .onError((e, _) => print("Error writing document: $e"));
    await getMovies();
  }

  Future<void> deleteMovie(Movie movie) async {
    await db.collection(auth.currentUser!.email.toString())
        .doc(movie.title)
        .delete();
  }

  Future<List<Movie>> getMovies() async {

    QuerySnapshot querySnapshot = await db.collection(auth.currentUser!.email.toString()).get();
    return watchMoviesList = querySnapshot.docs.map(
          (doc) => Movie.fromJson(
        doc.data() as Map<String, dynamic>,
      ),
    ).toList();
  }
}