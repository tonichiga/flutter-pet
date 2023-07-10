import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:my_app/entity/user_entity.dart';

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
  List<dynamic> userList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('lib/data/user.json');
      final data = await json.decode(response);

      List<User> users =
          data["users"].map<User>((user) => User.fromJson(user)).toList();
      setState(() {
        userList = users;
      });
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView.builder(
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
                        var user = userList[index];
                        // Navigator.pushNamed(context, '/details', arguments: {
                        //   "user": user,
                        //   "callback": handleUpdateContacts,
                        // });
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
            }),
      ),
    );
  }

  handleUpdateContacts(id, user) {
    final user = userList.firstWhere((element) => element.id == id);
    var newList = userList
        .map((element) => element.id == user.id ? user : element)
        .toList();
    print("User : $user");
    print("newList : $newList");

    setState(() {
      userList = newList;
    });
  }

// value type has name, email
}
