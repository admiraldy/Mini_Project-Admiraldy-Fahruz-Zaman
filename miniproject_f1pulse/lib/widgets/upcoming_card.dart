import 'package:flutter/material.dart';

class UpcomingRaceCard extends StatefulWidget {
  final String date;
  final String raceName;
  final String circuitName;
  final DateTime firstPracticeTime;
  final DateTime secondPracticeTime;
  final DateTime thirdPracticeTime;
  final DateTime qualifyingTime;
  final DateTime sprintTime;
  final DateTime raceTime;

  const UpcomingRaceCard({
    super.key,
    required this.date,
    required this.raceName,
    required this.circuitName,
    required this.raceTime,
    required this.firstPracticeTime,
    required this.secondPracticeTime,
    required this.thirdPracticeTime,
    required this.qualifyingTime,
    required this.sprintTime,
  });

  @override
  State<UpcomingRaceCard> createState() => _UpcomingRaceCardState();
}

class _UpcomingRaceCardState extends State<UpcomingRaceCard> {
  late List<DateTime> racesTime;
  late List<String> eventTitle;
  late Duration remainingTime;
  int currentEventIndex = 0;

  @override
  void initState() {
    super.initState();
    racesTime = [
      widget.firstPracticeTime,
      widget.secondPracticeTime,
      widget.thirdPracticeTime,
      widget.qualifyingTime,
      widget.sprintTime,
      widget.raceTime,
    ];
    eventTitle = [
      'First Practice Starts in',
      'Second Practice Starts in',
      'Third Practice Starts in',
      'Qualifying Starts in',
      'Sprint Starts in',
      'Race Starts in',
    ];
    updateRemainingTime();
  }

  void updateRemainingTime() {
    final currentTime = DateTime.now();
    if (currentEventIndex < racesTime.length) {
      remainingTime = racesTime[currentEventIndex].difference(currentTime);
      if (remainingTime.isNegative) {
        currentEventIndex++;
        if (currentEventIndex < racesTime.length) {
          remainingTime = racesTime[currentEventIndex].difference(currentTime);
        } else {
          remainingTime = Duration.zero;
        }
      }
    } else {
      remainingTime = Duration.zero;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/card.png'),
          height: 210,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.date,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.raceName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.circuitName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //show countdown card
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(currentEventIndex < eventTitle.length
                            ? eventTitle[currentEventIndex]
                            : ''),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 320,
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ShowTime(
                              clock: currentEventIndex < racesTime.length
                                  ? remainingTime.inDays.toString()
                                  : '00',
                              desc: 'Days',
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: Colors.grey,
                            ),
                            ShowTime(
                                clock: currentEventIndex < racesTime.length
                                    ? (remainingTime.inHours % 24)
                                        .toString()
                                        .padLeft(2, '0')
                                    : '00',
                                desc: 'Hours'),
                            Container(
                              width: 1,
                              height: 40,
                              color: Colors.grey,
                            ),
                            ShowTime(
                                clock: currentEventIndex < racesTime.length
                                    ? (remainingTime.inMinutes % 60)
                                        .toString()
                                        .padLeft(2, '0')
                                    : '00',
                                desc: 'Minutes')
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ShowTime extends StatelessWidget {
  final String clock;
  final String desc;
  const ShowTime({
    super.key,
    required this.clock,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          clock,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(desc),
      ],
    );
  }
}
