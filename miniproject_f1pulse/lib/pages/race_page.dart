import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';

class RacingTab extends StatefulWidget {
  const RacingTab({super.key});

  @override
  State<RacingTab> createState() => _RacingTabState();
}

class _RacingTabState extends State<RacingTab> {
  late Future<List<Race>> _raceDataFuture;

  @override
  void initState() {
    super.initState();
    _raceDataFuture = RaceAPI().getRaceData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Races',
            style: TextAppStyle().headerStye(),
          ),
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
                future: _raceDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No data'),
                    );
                  } else {
                    List<Race> race = snapshot.data as List<Race>;
                    List<Race> upcomingRaces = race
                        .where((r) => r.date.isAfter(DateTime.now()))
                        .toList();
                    return ListView.builder(
                      itemCount: upcomingRaces.length,
                      itemBuilder: (context, index) {
                        return RaceList(
                          onTap: () {
                            Navigator.pushNamed(context, '/upcomingRaceDetails',
                                arguments: upcomingRaces[index]);
                          },
                          countryImagePath:
                              upcomingRaces[index].countryImagePath,
                          round: upcomingRaces[index].round,
                          raceName: upcomingRaces[index].raceName,
                          date: upcomingRaces[index].date,
                        );
                      },
                    );
                  }
                }),
            FutureBuilder(
                future: _raceDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No data'),
                    );
                  } else {
                    List<Race> race = snapshot.data as List<Race>;
                    List<Race> pastRaces = race
                        .where((r) => r.date.isBefore(DateTime.now()))
                        .toList();
                    return ListView.builder(
                      itemCount: pastRaces.length,
                      itemBuilder: (context, index) {
                        return RaceList(
                          onTap: () {
                            Navigator.pushNamed(context, '/pastRaceDetails',
                                arguments: pastRaces[index]);
                          },
                          countryImagePath: pastRaces[index].countryImagePath,
                          round: pastRaces[index].round,
                          raceName: pastRaces[index].raceName,
                          date: pastRaces[index].date,
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class RaceList extends StatelessWidget {
  final VoidCallback onTap;
  final String countryImagePath;
  final String round;
  final String raceName;
  final DateTime date;
  const RaceList({
    super.key,
    required this.onTap,
    required this.countryImagePath,
    required this.round,
    required this.raceName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  countryImagePath,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Round $round',
                      style: TextAppStyle().roundStyle(),
                    ),
                    Text(raceName, style: TextAppStyle().titleStyle()),
                    Text(
                      DateFormat('dd MMMM yyyy').format(date),
                      style: TextAppStyle().subtitleStyle(),
                    ),
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
  }
}
