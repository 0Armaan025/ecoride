import 'package:ecoride/features/community/screens/forum_screen.dart';
import 'package:ecoride/features/home/screens/feature_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenNavigator extends StatefulWidget {
  const HomeScreenNavigator({super.key});

  @override
  State<HomeScreenNavigator> createState() => _HomeScreenNavigatorState();
}

class _HomeScreenNavigatorState extends State<HomeScreenNavigator> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screen = [HomeScreen(), ForumScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.featured_play_list,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: '⇑',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.commute,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: '⇑',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
      body: screen[_selectedIndex],
    );
  }
}
