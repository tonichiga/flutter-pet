import "package:flutter/material.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Список дел"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white70,
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Main Screen",
                  style: TextStyle(fontSize: 24, color: Colors.red)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/todo');
                  },
                  child: const Text("Перейти на экран контактов"))
            ],
          )
        ]));
  }
}
