import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/search/search_bloc.dart';
import 'package:my_app/bloc/search/search_event.dart';

class SubMain2 extends StatefulWidget {
  const SubMain2({super.key});

  @override
  State<SubMain2> createState() => _SubMain2State();
}

class _SubMain2State extends State<SubMain2> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SearchBloc())],
        child: MaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 33),
              titleMedium: TextStyle(fontSize: 22),
            ),
          ),
          home: const Scaffold(
            body: SafeArea(child: SubMainPage2()),
          ),
        ));
  }
}

class SubMainPage2 extends StatefulWidget {
  const SubMainPage2({super.key});

  @override
  State<SubMainPage2> createState() => _SubMainPage2State();
}

class _SubMainPage2State extends State<SubMainPage2> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = context.select((SearchBloc bloc) => bloc.state.users);
    return Column(children: [
      const Text("Search"),
      const SizedBox(height: 20),
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchUserEvent(value));
        },
      ),
      if (users.isNotEmpty)
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]['title']),
            );
          },
          itemCount: users.length,
        ))
    ]);
  }
}
