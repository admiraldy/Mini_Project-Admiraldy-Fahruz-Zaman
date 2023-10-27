import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';

class RacingTab extends StatefulWidget {
  const RacingTab({super.key});

  @override
  State<RacingTab> createState() => _RacingTabState();
}

class _RacingTabState extends State<RacingTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: RaceAPI().getRace(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Race> race = snapshot.data as List<Race>;
                  List<Race> upcomingRaces = race
                      .where((r) => r.date.isAfter(DateTime.now()))
                      .toList();
                  return ListView.builder(
                    itemCount: upcomingRaces.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/upcomingRaceDetails',
                              arguments: upcomingRaces[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, top: 10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    upcomingRaces[index].countryImagePath,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Round ${upcomingRaces[index].round}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        upcomingRaces[index].raceName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(DateFormat('dd MMMM yyyy')
                                          .format(upcomingRaces[index].date)),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('error'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: RaceAPI().getRace(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Race> race = snapshot.data as List<Race>;
                  List<Race> pastRaces = race
                      .where((r) => r.date.isBefore(DateTime.now()))
                      .toList();
                  return ListView.builder(
                    itemCount: pastRaces.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/raceDetails',
                              arguments: pastRaces[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, right: 8, top: 10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    pastRaces[index].countryImagePath,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Round ${pastRaces[index].round}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        pastRaces[index].raceName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(DateFormat('dd MMMM yyyy')
                                          .format(pastRaces[index].date)),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('error'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
