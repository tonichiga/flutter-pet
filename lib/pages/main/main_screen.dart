import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/entity/post_entity.dart';
import 'package:my_app/pages/main/screens/home/home_screen.dart';
import 'package:my_app/pages/main/screens/post/posts_screen.dart';
import 'package:my_app/pages/main/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  String _selectedScreen = "Home";
  List<PostEntity> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();

    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('lib/data/post.json');
      final data = await json.decode(response) as List<dynamic>;
      final List<PostEntity> postsData =
          data.map((e) => PostEntity.fromJson(e)).toList();
      setState(() {
        posts = postsData;
      });
    } catch (e) {
      print("Home readJson error: $e");
    }
  }

  static const ScreenNames = <String>[
    "Home",
    "Post",
    "Profile",
  ];

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
      HomeScreen(posts: posts),
      const PostScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
      // floatingActionButton: const FloatBtn(),
      body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              width: double.infinity,
              color: Colors.white,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: 0,
                    collapsedHeight: 0,
                    expandedHeight: 60,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/avatar.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
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
    ;
  }
}
