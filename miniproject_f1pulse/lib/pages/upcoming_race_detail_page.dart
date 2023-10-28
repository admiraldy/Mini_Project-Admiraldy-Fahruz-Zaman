import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/widgets/race_info.dart';
import 'package:miniproject_f1pulse/widgets/upcoming_card.dart';

class UpcomingRaceDetails extends StatelessWidget {
  const UpcomingRaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Race race = ModalRoute.of(context)!.settings.arguments as Race;
    String raceDate = DateFormat('dd MMMM yyyy').format(race.date);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpcomingRaceCard(
              date: raceDate,
              raceName: race.raceName,
              circuitName: race.circuitName,
              raceTime: race.time,
            ),
            const SizedBox(height: 10),
            const RaceDetailsInfo()
          ],
        ),
      ),
    );
  }
}
