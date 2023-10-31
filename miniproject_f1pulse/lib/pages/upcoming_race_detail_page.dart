import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/widgets/races_component/race_info.dart';
import 'package:miniproject_f1pulse/widgets/upcoming_card.dart';

class UpcomingRaceDetails extends StatelessWidget {
  const UpcomingRaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Race race = Get.arguments as Race;
    String raceDate = DateFormat('dd MMMM yyyy').format(race.date);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Get.back();
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
              firstPracticeTime: race.firstPractice ?? DateTime.now(),
              secondPracticeTime: race.secondPractice ?? DateTime.now(),
              thirdPracticeTime: race.thirdPractice ?? DateTime.now(),
              qualifyingTime: race.qualifying ?? DateTime.now(),
              sprintTime: race.qualifying ?? DateTime.now(),
            ),
            const SizedBox(height: 10),
            const RaceDetailsInfo()
          ],
        ),
      ),
    );
  }
}
