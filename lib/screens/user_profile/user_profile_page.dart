import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/user_profile/user_profile_view.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => UserProfileController();
}

class UserProfileController extends State<UserProfilePage> {
  final firebaseService = FirebaseService();
  late User user;

  @override
  Widget build(BuildContext context) => UserProfileView(this);

  @override
  void initState() {
    super.initState();
    user = firebaseService.currentUser();
  }
}
