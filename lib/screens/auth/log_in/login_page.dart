import 'package:flutter/material.dart';
import 'package:movies_application/main.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/auth/result.dart';
import 'package:movies_application/screens/auth/utils/utils.dart';
import 'login_view.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  final VoidCallback onClickedSignUp;

  @override
  State<LogInPage> createState() => LoginController();
}

class LoginController extends State<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final firebaseService = FirebaseService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LoginView(this);

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator(),
      ),
    );

    final result = await firebaseService.signInService(emailController.text.trim(), passwordController.text.trim());
    if (result.status == ResultStatus.success) {
      Utils.showSnackBar('You are sign up with: ${result.value?.user?.displayName}',
          Colors.green.withOpacity(0.6));
    } else {
      Utils.showSnackBar(result.error, Colors.red);
      navigationKey.currentState?.popUntil((route) => route.isFirst);
      return;
    }
    navigationKey.currentState?.popUntil((route) => route.isFirst);
  }
}
