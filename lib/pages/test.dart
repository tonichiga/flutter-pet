import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _Test createState() => _Test();
}

class _Test extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          height: 30,
          width: 285,
          // color: ThemeColors.purple,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: ThemeColors.purple,
          ),
        ),
        Container(
          height: 187,
          // color: ThemeColors.purple,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: ThemeColors.darkPurple,
          ),
        )
      ],
    ));
  }
}
