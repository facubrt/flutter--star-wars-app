import 'package:flutter/material.dart';
import 'package:starwapp/constants/constants.dart';
import 'package:starwapp/views/pages/home/home_page.dart';
import 'package:starwapp/views/pages/menu/menu_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late int currentIndex;
  final pages = const [
    HomePage(),
    MenuPage(),
  ];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 26,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            label: HOME_PAGE,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: MENU_PAGE,
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
