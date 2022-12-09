import 'package:flutter/material.dart';

class Utils {
  static final messengerKey =GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, Color backgroundColor) {
    if(text == null) return;

    final snackBar = SnackBar(content: Text(text),
      backgroundColor: backgroundColor,
      duration: backgroundColor == Colors.red
          ? const Duration(seconds: 7)
          : const Duration(seconds: 3),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}