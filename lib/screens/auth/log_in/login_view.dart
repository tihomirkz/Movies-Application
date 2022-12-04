import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';

import 'login_widget.dart';

class LoginView extends StatelessWidget {
  final LoginController state;
  const LoginView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text(text: 'Sign in Movies', size: 35, color: Colors.blueGrey),
          const SizedBox(height: 40),
          textField(state.emailController, 'Email', TextInputAction.next, false),
          const SizedBox(height: 4),
          textField(state.passwordController, 'Password', TextInputAction.done, true),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.lock_open, size: 32),
            label: const Text(
              'Sign In',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: state.signIn,
          ),
        ],
      ),
    );
  }
}
