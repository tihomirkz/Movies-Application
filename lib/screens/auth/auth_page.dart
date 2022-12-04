import 'package:flutter/cupertino.dart';
import 'package:movies_application/screens/auth/sign_up/signup_page.dart';

import 'log_in/login_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin ?
      LogInPage(onClickedSignUp: toggle)
      : SignUpPage(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
