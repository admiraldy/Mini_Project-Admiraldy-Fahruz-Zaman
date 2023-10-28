import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/pages/home_page.dart';
import 'package:miniproject_f1pulse/pages/race_page.dart';
import 'package:miniproject_f1pulse/pages/standing_page.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List _pages = [
    const HomeTab(),
    const RacingTab(),
    const StandingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: SlidingClippedNavBar(
        barItems: [
          BarItem(
            title: 'Home',
            icon: Icons.home,
          ),
          BarItem(title: 'Race', icon: Icons.sports_score),
          BarItem(title: 'Standing', icon: Icons.format_list_numbered),
        ],
        selectedIndex: selectedIndex,
        onButtonPressed: _onButtonPressed,
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
