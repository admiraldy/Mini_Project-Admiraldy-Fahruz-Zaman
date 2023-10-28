import 'package:flutter/material.dart';

class CountdownCard extends StatefulWidget {
  final DateTime raceTime;
  const CountdownCard({super.key, required this.raceTime});

  @override
  State<CountdownCard> createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  late DateTime racesTime;
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    racesTime = widget.raceTime;
    updateRemainingTime();
  }

  void updateRemainingTime() {
    final currentTime = DateTime.now();
    remainingTime = racesTime.difference(currentTime);
    if (remainingTime.isNegative) {
      remainingTime = Duration.zero;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('RACE STARTS IN'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      remainingTime.inDays.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('days'),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      (remainingTime.inHours % 24).toString().padLeft(2, '0'),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('hours'),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      (remainingTime.inMinutes % 60).toString().padLeft(2, '0'),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('minutes'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
