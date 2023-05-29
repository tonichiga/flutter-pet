import "package:flutter/material.dart";

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreen();
}

class _TodoScreen extends State<TodoScreen> {
  final String _userTodo = "";
  final List<String> todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(["1", "2", "3"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Список дел"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(todoList[index]),
                  child: Card(child: ListTile(title: Text(todoList[index]))));
            }));
  }
}
