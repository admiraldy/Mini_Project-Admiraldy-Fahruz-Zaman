import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/result_model.dart';
import 'package:miniproject_f1pulse/widgets/driver_card.dart';

class RaceResuts extends StatelessWidget {
  final List<Result>? results;
  const RaceResuts({super.key, this.results});

  @override
  Widget build(BuildContext context) {
    if (results == null || results!.isEmpty) {
      return const Center(
        child: Text('No results'),
      );
    } else {
      return ListView.builder(
        itemCount: results!.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 25,
                    child: Text(
                      results![index].position,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 5,
                    color: Color(int.parse(
                        results![index].colorScheme.replaceAll('#', '0xFF'))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          results![index].driverCode,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          results![index].time,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Text('+${results![index].points} PTS',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 50, top: 10, right: 30),
                  child: Column(
                    children: [
                      DriverCard(
                        driverName: results![index].driverName,
                        constructorName: results![index].constructorName,
                        driverImage: results![index].driverImage,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Race Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, top: 10, right: 30, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Status',
                                style: TextStyle(color: Colors.grey)),
                            Text(results![index].status,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Lap Finised',
                                style: TextStyle(color: Colors.grey)),
                            Text(
                              results![index].laps,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Starting Grid',
                                style: TextStyle(color: Colors.grey)),
                            Text(results![index].grid,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Fastest Lap Time',
                                style: TextStyle(color: Colors.grey)),
                            Text(results![index].fastestLapTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Average Speed',
                                style: TextStyle(color: Colors.grey)),
                            Text('${results![index].averageSpeed} kph',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      );
    }
  }
}
