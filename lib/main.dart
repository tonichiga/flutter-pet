import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/bloc/counter_bloc/counter_block.dart';
import 'package:my_app/bloc/user_bloc/user_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_bloc.dart';
import 'package:my_app/entity/users/user.dart';
import 'package:my_app/pages/contacts.dart';
import 'package:my_app/pages/details.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/test.dart';
import 'package:my_app/services/user_api_provider.dart';
import 'package:my_app/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(
      const BottomNavigationBarExampleApp(),
    );

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
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

// Initial call custom method (fetching data from API, etc....)
    final bloc = CounterBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(bloc),
        ),
      ],
      child: Scaffold(
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
                                    customBorder:
                                        const RoundedRectangleBorder(),
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
      ),
    );
  }
}

//  body: Center(
//         child: Container(
//             decoration: BoxDecoration(
//               color: Colors.teal,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: ThemeColors.purple,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Image.asset(
//                           'assets/images/avatar.png', // путь к изображению
//                           width: 43, // ширина изображения
//                           height: 43, // высота изображения
//                         ),
//                       ),
//                       SvgPicture.asset('assets/images/svg/alert.svg',
//                           colorFilter:
//                               ColorFilter.mode(Colors.black, BlendMode.srcIn),
//                           semanticsLabel: 'A red up arrow')
//                     ],
//                   ),
//                 ),
//                 // _widgetOptions.elementAt(_selectedIndex)
//               ],
//             )),
//       ),
/////////


// import 'package:flutter/material.dart';
// import 'package:my_app/pages/contacts.dart';
// import 'package:my_app/pages/details.dart';
// import 'package:my_app/pages/home.dart';
// import 'package:my_app/pages/home_screen.dart';
// import 'package:my_app/pages/signin.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData.dark(),
//     routes: {
//       '/': (context) => const Home(),
//       "/todo": (context) => const TodoScreen(),
//       "/details": (context) => Details(),
//     },
//   ));
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // TRY THIS: Try running your application with "flutter run". You'll see
// //         // the application has a blue toolbar. Then, without quitting the app,
// //         // try changing the seedColor in the colorScheme below to Colors.green
// //         // and then invoke "hot reload" (save your changes or press the "hot
// //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// //         // the command line to start the app).
// //         //
// //         // Notice that the counter didn't reset back to zero; the application
// //         // state is not lost during the reload. To reset the state, use hot
// //         // restart instead.
// //         //
// //         // This works for code too, not just values: Most code changes can be
// //         // tested with just a hot reload.
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});

// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.

// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // TRY THIS: Try changing the color here to a specific color (to
// //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //         // change color while the other colors stay the same.
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           //
// //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //           // action in the IDE, or press "p" in the console), to see the
// //           // wireframe for each widget.
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
