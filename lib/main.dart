import 'package:flutter/material.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/main/main_screen.dart';
import 'package:my_app/pages/main/screens/post_details/post_details.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white, // Установка цвета фона Scaffold
      // Другие настройки темы
    ),
    routes: {
      "/": (context) => const MainScreen(),
      '/login': (context) => const LoginScreen(),
      "/post": (context) => const PostDetails(),
    },
  ));
}
