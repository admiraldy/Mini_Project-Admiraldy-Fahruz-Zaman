import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';

class RaceDetailsInfo extends StatelessWidget {
  const RaceDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final Race race = ModalRoute.of(context)!.settings.arguments as Race;
    Widget? firstPractice;
    Widget? secondPractice;
    Widget? thirdPractice;
    Widget? qualifying;
    Widget? sprint;
    if (race.firstPractice != null) {
      firstPractice = RaceWeekendCard(
          title: 'First Practice',
          day: DateFormat('dd').format(race.firstPractice!),
          month: DateFormat('MMM').format(race.firstPractice!),
          time: DateFormat('HH:mm').format(race.firstPractice!));
    } else {
      firstPractice = Container();
    }
    if (race.secondPractice != null) {
      secondPractice = RaceWeekendCard(
          title: 'Second Practice',
          day: DateFormat('dd').format(race.secondPractice!),
          month: DateFormat('MMM').format(race.secondPractice!),
          time: DateFormat('HH:mm').format(race.secondPractice!));
    } else {
      secondPractice = Container();
    }
    if (race.thirdPractice != null) {
      thirdPractice = RaceWeekendCard(
          title: 'Third Practice',
          day: DateFormat('dd').format(race.thirdPractice!),
          month: DateFormat('MMM').format(race.thirdPractice!),
          time: DateFormat('HH:mm').format(race.thirdPractice!));
    } else {
      thirdPractice = Container();
    }
    if (race.qualifying != null) {
      qualifying = RaceWeekendCard(
          title: 'Qualifying',
          day: DateFormat('dd').format(race.qualifying!),
          month: DateFormat('MMM').format(race.qualifying!),
          time: DateFormat('HH:mm').format(race.qualifying!));
    } else {
      qualifying = Container();
    }
    if (race.sprint != null) {
      sprint = RaceWeekendCard(
          title: 'Sprint',
          day: DateFormat('dd').format(race.sprint!),
          month: DateFormat('MMM').format(race.sprint!),
          time: DateFormat('HH:mm').format(race.sprint!));
    } else {
      sprint = Container();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Circuit',
                  style: TextAppStyle().titleStyle2(),
                ),
                const SizedBox(height: 20),
                Image.asset(race.imagePath),
                const SizedBox(height: 20),
                Text(
                  'Race Weekend',
                  style: TextAppStyle().titleStyle2(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          firstPractice,
          secondPractice,
          thirdPractice,
          qualifying,
          sprint,
          RaceWeekendCard(
              title: 'Race',
              day: DateFormat('dd').format(race.date),
              month: DateFormat('MMM').format(race.date),
              time: DateFormat('HH:mm').format(race.time))
        ],
      ),
    );
  }
}

class RaceWeekendCard extends StatelessWidget {
  final String title;
  final String day;
  final String month;
  final String time;
  const RaceWeekendCard(
      {super.key,
      required this.title,
      required this.day,
      required this.month,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  day,
                  style: TextAppStyle().titleStyle(),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      month.toUpperCase(),
                      style: TextAppStyle().monthStyle(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 1,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextAppStyle().titleStyle()),
                Text(
                  time,
                  style: TextAppStyle().subtitleStyle(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
