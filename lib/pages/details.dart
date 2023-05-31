import "package:flutter/material.dart";
import "package:my_app/entity/users/user.dart";

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? user;
  final name = "";
  final email = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var modalData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var userData = modalData['user'] as User;
    setState(() {
      user = userData;
    });
    print("User : $user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact ${user?.name}'), centerTitle: true),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${user?.name}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: ${user?.email}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your name',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate will return true if the form is valid, or false if
                                    // the form is invalid.
                                    if (_formKey.currentState!.validate()) {
                                      handleEdit();
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                )
              : const Text('User is not available'),
        )
      ]),
    );
  }

  void handleEdit() {
    print();
  }

  handleChangeForm(e) {
    print(e);
  }
}
