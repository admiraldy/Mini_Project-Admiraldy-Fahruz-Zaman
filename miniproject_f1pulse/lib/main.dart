import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/pages/main_page.dart';
import 'package:miniproject_f1pulse/pages/news_page.dart';
import 'package:miniproject_f1pulse/pages/race_detail_page.dart';

void main() {
  runApp(const F1PulseApp());
}

class F1PulseApp extends StatelessWidget {
  const F1PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/raceDetails': (context) => const RaceDetails(),
        '/newsDetails': (context) => NewsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class StandingTab extends StatelessWidget {
  const StandingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Standing'),
    );
  }
}
