import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DEmailSnackBar {
  static void show(BuildContext context, String message, int duration) {
    ScaffoldMessengerState state = ScaffoldMessenger.of(context);
    state.hideCurrentSnackBar();

    state.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ));
  }
}
