import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/pages/main_page.dart';
import 'package:miniproject_f1pulse/pages/news_page.dart';
import 'package:miniproject_f1pulse/pages/past_race_details_page.dart';
import 'package:miniproject_f1pulse/pages/upcoming_race_detail_page.dart';

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
        '/upcomingRaceDetails': (context) => const UpcomingRaceDetails(),
        '/newsDetails': (context) => const NewsPage(),
        '/pastRaceDetails': (context) => const PastRaceDetails(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
