import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/bloc/counter_bloc/counter_block.dart';
import 'package:my_app/bloc/user_bloc/user_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_state.dart';
import 'package:my_app/entity/users/user.dart';
import 'package:my_app/pagesDepr/contacts.dart';
import 'package:my_app/pagesDepr/details.dart';
import 'package:my_app/pagesDepr/home.dart';
import 'package:my_app/pagesDepr/test.dart';
import 'package:my_app/services/user_api_provider.dart';
import 'package:my_app/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Main1 extends StatelessWidget {
  const Main1({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => counterBloc,
        ),
        BlocProvider(
          create: (context) => UserBloc(counterBloc),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainExample(),
      ),
    );
  }
}

class MainExample extends StatefulWidget {
  const MainExample({super.key});

  @override
  State<MainExample> createState() => _MainExample();
}

class _MainExample extends State<MainExample> {
  int _selectedIndex = 0;
  String _selectedScreen = "Home";
  static const ScreenNames = <String>[
    "Home",
    "Details",
    "Contacts",
  ];

  List<String> chartData = [];
  final UserApiProvider _providerApi = UserApiProvider();

  @override
  void initState() {
    super.initState();

    fetchUser();
  }

  Future<void> fetchUser() async {
    final users = await _providerApi.fetchUsers();
    // print("User list $users");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('lib/data/chart.json');
      final data = await json.decode(response) as Map<String, dynamic>;
      List<String> dataList = List<String>.from(data["data"]);

      setState(() {
        chartData = dataList;
      });

      // print("Chart data $chartData");
    } catch (e) {
      print("Home readJson error: $e");
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    String currentScreen = ScreenNames[index];
    setState(() {
      _selectedScreen = currentScreen;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      Home(chartData: chartData),
      Test(),
      Test(),
    ];

    return Scaffold(
      // floatingActionButton: const FloatBtn(),
      body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              width: double.infinity,
              color: Colors.teal,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 0,
                    collapsedHeight: 0,
                    expandedHeight: 60,
                    backgroundColor: Colors.teal,
                    shadowColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FloatBtn(),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                  // shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    print("CLICK");
                                    // Действие при нажатии кнопки
                                  },
                                  customBorder: const RoundedRectangleBorder(),
                                  splashColor: Colors.red,
                                  highlightColor: Colors.purple,
                                  child:
                                      Image.asset("assets/images/avatar.png"),
                                ),
                              )
                              // child: InkWell(
                              //   onTap: () {},
                              //   child: Ink(
                              //     width: 43,
                              //     height: 43,
                              //     decoration: const BoxDecoration(
                              //       color: Colors.red,
                              //       borderRadius: BorderRadiusGeometry.
                              //       image: DecorationImage(
                              //         image: AssetImage(
                              //           'assets/images/avatar.png',
                              //         ),
                              //       ),
                              //       // путь к изображению
                              //       // высота изображения
                              //     ),
                              //   ),
                              // ),
                              ),
                          SvgPicture.asset('assets/images/svg/alert.svg',
                              colorFilter: ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                              semanticsLabel: 'A red up arrow')
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: widgetOptions.elementAt(_selectedIndex)),
                ],
              ))),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class FloatBtn extends StatelessWidget {
  const FloatBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) => BlocListener<CounterBloc, int>(
        listener: (context, state) {
          Scaffold.of(context).showBottomSheet(
              (context) => Container(child: Text("Hello world")));
        },
        child: Center(child: Text("Hello world")),
      ),
    );
  }
}
