import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mercado_libre_app/src/models/categories.dart';
import 'package:mercado_libre_app/src/screens/ProfileScreen.dart';
import 'package:mercado_libre_app/src/screens/menuPrincipal.dart';

import 'package:mercado_libre_app/src/widgets/appBarCustom.dart';

class MainScreen extends StatefulWidget {
  final User userData;
  const MainScreen({Key? key, required this.userData}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          MenuPrincipal(userData: widget.userData),
          Profilescreen(userData: widget.userData),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 40, color: Colors.white),
          Icon(Icons.person, size: 40, color: Colors.white),
        ],
        color: const Color.fromARGB(255, 155, 51, 47),
        backgroundColor: const Color.fromARGB(255, 11, 9, 30),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
