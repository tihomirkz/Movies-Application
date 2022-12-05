import 'package:flutter/material.dart';
import 'package:movies_application/screens/auth/widgets/login_signup_widget.dart';
import 'login_page.dart';

class LoginView extends StatelessWidget {
  final LoginController state;
  const LoginView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return logInSignUp(
      isSignIn: false,
      email: state.emailController,
      password: state.passwordController,
      onPressedButton: state.signIn,
      onPressedText: state.widget.onClickedSignUp,
    );
  }
}
