import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 32),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE8E8E8), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       width: 3.0,
                    //       color:
                    //           Colors.blue), // Измените толщину и цвет границы
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE8E8E8), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 43),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                100), // Задайте желаемый радиус границы
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(const Size(
                            double.infinity,
                            50)), // Задайте желаемые размеры кнопки
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(
                                0xFFFF6C00)), // Задайте желаемый цвет фона
                      ),
                      onPressed: onPressed,
                      child: const Text("Login")),
                ),
                const SizedBox(height: 36),
                // right forgot password
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),

                // Ваш инпут и другие виджеты
              ],
            ),
          ),
        ),
      ],
    )));
  }

  void onPressed() {
    print("Pressed");
  }
}
