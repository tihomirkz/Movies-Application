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

  Future<void> setMoviesList(List<Movie> movies) async {
    for (var movie in movies) {
      await db.collection(auth.currentUser!.email.toString())
          .doc(movie.title)
          .set(movie.toJson())
          .onError((e, _) => print("Error writing document: $e"));
    }
  }

  Future<void> updateWatchList(Movie movie) async {
    await db.collection(auth.currentUser!.email.toString())
        .doc(movie.title)
        .update({"isLiked": movie.isLiked}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future<List<Movie>> getWatchMovies() async {
    QuerySnapshot querySnapshot = await db.collection(auth.currentUser!.email.toString()).where("isLiked", isEqualTo: true).get();
    final moviesList = querySnapshot.docs.map(
          (doc) => Movie.fromJson(
        doc.data() as Map<String, dynamic>,
      ),
    ).toList();
    watchMoviesList = moviesList..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
    return watchMoviesList;
  }

  Future<List<Movie>> getAllMovies() async {
    QuerySnapshot querySnapshot = await db.collection(auth.currentUser!.email.toString()).get();
    return dataFromMovies(querySnapshot);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamAllMovies() {
    return db.collection(auth.currentUser!.email.toString()).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamWatchMovies() {
    return db.collection(auth.currentUser!.email.toString()).where("isLiked", isEqualTo: true).snapshots();
  }

  List<Movie> dataFromMovies(QuerySnapshot querySnapshot)  {
    final moviesList = querySnapshot.docs.map(
          (doc) => Movie.fromJson(
        doc.data() as Map<String, dynamic>,
      ),
    ).toList();
    return moviesList..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
  }

}