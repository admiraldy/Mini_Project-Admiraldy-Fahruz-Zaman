import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/widgets/countdown_card.dart';

class UpcomingRaceCard extends StatelessWidget {
  final String date;
  final String raceName;
  final String circuitName;
  final DateTime raceTime;

  const UpcomingRaceCard({
    super.key,
    required this.date,
    required this.raceName,
    required this.circuitName,
    required this.raceTime,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/card.png'),
          height: 200,
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
                  date,
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
                          raceName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          circuitName,
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
                CountdownCard(raceTime: raceTime),
              ],
            ),
          ),
        )
      ],
    );
  }
}
