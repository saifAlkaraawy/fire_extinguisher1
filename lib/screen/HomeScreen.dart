import 'package:fire_extinguisher/screen/DiscoverScreen.dart';
import 'package:fire_extinguisher/screen/notDiscover.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[NotDiscover(), Discover()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_extinguisher_sharp),
            label: 'لم يتم الكشف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'تم الكشف',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
