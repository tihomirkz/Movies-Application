import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/main.dart';
import 'package:movies_application/screens/auth/sign_up/signup_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<SignUpPage> createState() => SignUpController();
}

class SignUpController extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SignUpView(this);

  Future signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e);
    }
    navigationKey.currentState?.popUntil((route) => route.isFirst);
  }
}
