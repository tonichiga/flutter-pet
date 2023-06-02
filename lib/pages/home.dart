import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            height: 360,
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(),
            ),
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Home",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      const Row(
        children: [
          Text("Analytics"),
        ],
      ),
      const Row(
        children: [
          Text("Transactions"),
        ],
      )
    ]);
  }
}
