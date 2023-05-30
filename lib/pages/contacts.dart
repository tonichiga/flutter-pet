import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:my_app/entity/users/user.dart";

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreen();
}

class UserData {
  final List<User> users;

  UserData(this.users);
}

class _TodoScreen extends State<TodoScreen> {
  final String _userTodo = "";
  List<User> userList = [];

  @override
  void initState() {
    super.initState();

    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('lib/data/user.json');
      final data = await json.decode(response) as UserData;
      final List<User> users = data.users;
      userList = [...users];

      print("data : $data");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Список дел"),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(userList[index].name),
                  onDismissed: (direction) {
                    // ignore: avoid_print
                    print("Clicked $index");
                    setState(() {
                      userList.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$index dismissed')));
                  },
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        backgroundColor: Colors.transparent, // Background color
                      ),
                      onPressed: () {
                        print("Clicked $index");
                        setState(() {
                          userList.removeAt(index);
                        });
                        Navigator.pushNamed(context, '/details', arguments: {
                          "index": () {},
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            child: ListTile(
                                title: Text(
                              userList[index].name,
                            )),
                          ),
                        ],
                      )));
            }));
  }
}
