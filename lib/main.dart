import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/login.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    routes: {
      "/login": (context) => const HomeScreen(),
      '/': (context) => const LoginScreen(),
    },
  ));
}
