import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/screens/discover_screen.dart';

import '../screens/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  void _onItemTapped(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  final List children = [
    const HomeScreen(),
    const DiscoverScreen(),
    Container(),
    Container(),
  ];

  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kScaffold,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreenIndex,
        onTap: _onItemTapped,
        selectedItemColor: kAccentColor,
        unselectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.discover),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.music),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.headphone),
            label: 'Home',
          ),
        ],
      ),
      body: children[currentScreenIndex],
    );
  }
}
