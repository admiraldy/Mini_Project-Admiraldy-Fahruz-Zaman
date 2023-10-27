import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/widgets/upcoming_card.dart';

class UpcomingRaceDetails extends StatelessWidget {
  const UpcomingRaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Race race = ModalRoute.of(context)!.settings.arguments as Race;
    String raceDate = DateFormat('dd MMMM yyyy').format(race.date);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'Schedule'),
            Tab(
              text: 'Circuit',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                UpcomingRaceCard(
                  date: raceDate,
                  raceName: race.raceName,
                  circuitName: race.circuitName,
                  raceTime: race.date,
                ),
                const SizedBox(height: 10),
                const Text('Schedule'),
                const SizedBox(height: 10),
                Column(
                  children: [
                    const Text('First Practice'),
                    const SizedBox(height: 10),
                    const Text('Second Practice'),
                    const Text('Friday, 14:00 - 15:30'),
                    const SizedBox(height: 10),
                    const Text('Third Practice'),
                    const Text('Saturday, 11:00 - 12:00'),
                    const SizedBox(height: 10),
                    const Text('Qualifying'),
                    const Text('Saturday, 14:00 - 15:00'),
                    const SizedBox(height: 10),
                    const Text('Sprint'),
                    const Text('Sunday, 12:00 - 13:00'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 16, left: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        race.countryImagePath,
                        height: 50,
                      ),
                      Column(
                        children: [Text(race.circuitName)],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
