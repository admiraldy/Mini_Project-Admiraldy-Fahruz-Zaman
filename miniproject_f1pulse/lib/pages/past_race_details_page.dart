import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/widgets/race_info.dart';

class PastRaceDetails extends StatelessWidget {
  const PastRaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Race race = ModalRoute.of(context)!.settings.arguments as Race;
    final List<Result> result = race.results ?? [];
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
        body: TabBarView(
          children: [
            // Display race information
            const RaceDetailsInfo(),
            //Display the race results
            ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                final results = result[index];
                return ListTile(
                  title: Text(results.driverName),
                  subtitle: Text(results.constructorName),
                  leading: Text(results.position.toString()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
