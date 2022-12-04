import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';
import 'signup_page.dart';

class SignUpView extends StatelessWidget {
  final SignUpController state;
  const SignUpView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text(text: 'Sign Up', size: 35, color: Colors.blueGrey),
          const SizedBox(height: 40),
          textField(state.emailController, 'Email', TextInputAction.next, false),
          const SizedBox(height: 4),
          textField(state.passwordController, 'Password', TextInputAction.done, true),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.arrow_forward, size: 32),
            label: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: state.signUp,
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 18),
              text: 'Already have an account? ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap =  state.widget.onClickedSignIn,
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blueGrey, fontSize: 18),
                  text: 'Log In',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
