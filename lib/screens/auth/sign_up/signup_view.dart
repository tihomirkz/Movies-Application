import 'package:flutter/material.dart';
import 'package:movies_application/screens/auth/widgets/login_signup_widget.dart';
import 'signup_page.dart';

class SignUpView extends StatelessWidget {
  final SignUpController state;
  const SignUpView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return logInSignUp(
      isSignIn: true,
      email: state.emailController,
      password: state.passwordController,
      onPressedButton: state.signUp,
      onPressedText: state.widget.onClickedSignIn,
      formKey: state.formKey,
    );
  }
}
