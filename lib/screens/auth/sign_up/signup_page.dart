import 'package:flutter/material.dart';
import 'package:movies_application/main.dart';
import 'package:movies_application/screens/auth/result.dart';
import 'package:movies_application/screens/auth/sign_up/signup_view.dart';
import 'package:movies_application/screens/auth/utils/utils.dart';
import 'package:movies_application/screens/home/movies_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<SignUpPage> createState() => SignUpController();
}

class SignUpController extends State<SignUpPage> with MoviesService {
  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SignUpView(this);

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator(),
      ),
    );

    try {
      final result =  await firebaseService.signUpService(emailController.text.trim(), passwordController.text.trim(), displayNameController.text.trim());
      if (result.status == ResultStatus.success) {
        Utils.showSnackBar('You are sign up with: ${displayNameController.text.trim()}',
            Colors.green.withOpacity(0.6));
        final result2 = await fetchMovies();
        if (result2.status == ResultStatus.error) {
          Utils.showSnackBar(result2.error, Colors.red);
          navigationKey.currentState?.popUntil((route) => route.isFirst);
          return;
        }
      } else {
        Utils.showSnackBar(result.error, Colors.red);
        navigationKey.currentState?.popUntil((route) => route.isFirst);
        return;
      }
      navigationKey.currentState?.popUntil((route) => route.isFirst);
    } catch (e) {
      Utils.showSnackBar(e.toString(), Colors.red);
      navigationKey.currentState?.popUntil((route) => route.isFirst);
    }

  }
}
