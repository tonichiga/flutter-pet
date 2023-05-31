import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _Form();
}

class _Form extends State<Form> {
  final _formKey = GlobalKey<FormState>();
  final name = "";
  final email = "";
  final password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: TextField(
            onChanged: (value) {
              updateUserData(value, 'name');
            },
            onSubmitted: (value) {
              print('Отправленный текст: $value');
            },
            decoration: const InputDecoration(
              labelText: 'Enter name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: TextField(
            onChanged: (value) {
              updateUserData(value, 'email');
            },
            onSubmitted: (value) {
              print('Отправленный текст: $value');
            },
            decoration: const InputDecoration(
              labelText: 'Enter email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  void handleChange(value) {}
  void updateUserData(String value, String field) {
    setState(() {});
  }
}
