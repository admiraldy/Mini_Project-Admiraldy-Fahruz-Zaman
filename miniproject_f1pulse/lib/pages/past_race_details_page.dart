import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/widgets/race_info.dart';

class PastRaceDetails extends StatelessWidget {
  const PastRaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Race Info'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Display race information
            RaceDetailsInfo(),
          ],
        ),
      ),
    );
  }
}
