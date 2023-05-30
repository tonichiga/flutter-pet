import "package:flutter/material.dart";

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  final name = "";
  final phone = "";
  final email = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(arguments);
    return Scaffold(
      appBar: AppBar(title: const Text("Details screen"), centerTitle: true),
      body: const Column(children: [Text("Details screen")]),
    );
  }
}
