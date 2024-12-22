import 'package:flutter/material.dart';

class AppNavigators {
  static void pushAndReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
