import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';
import 'package:miniproject_f1pulse/widgets/races_component/race_info.dart';
import 'package:miniproject_f1pulse/widgets/races_component/race_result.dart';

class PastRaceDetails extends StatelessWidget {
  const PastRaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Race race = ModalRoute.of(context)!.settings.arguments as Race;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            race.raceName,
            style: TextAppStyle().titleStyle(),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Race Info'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Display race information
            const RaceDetailsInfo(),
            //Display the race results
            RaceResuts(
              results: race.results,
            )
          ],
        ),
      ),
    );
  }
}
