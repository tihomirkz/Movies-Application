import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';

Widget logInSignUp({
  required bool isSignIn,
  required TextEditingController email,
  required TextEditingController password,
  required VoidCallback onPressedButton,
  required VoidCallback onPressedText,
}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(text: isSignIn ? 'Sign Up' : 'Sign In', size: 35, color: Colors.blueGrey),
        const SizedBox(height: 40),
        textField(email, 'Email', TextInputAction.next, false),
        const SizedBox(height: 4),
        textField(password, 'Password', TextInputAction.done, true),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          icon: isSignIn ? const Icon(Icons.arrow_forward, size: 32) :
          const Icon(Icons.lock_open, size: 32),
          label: Text(
            isSignIn ? 'Sign Up' : 'Sign In',
            style: const TextStyle(fontSize: 24),
          ),
          onPressed: onPressedButton,
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            text: isSignIn ? 'Already have an account? ' : 'No account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = onPressedText,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blueGrey, fontSize: 18),
                text: isSignIn ? 'Log In' : 'Sign Up',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}