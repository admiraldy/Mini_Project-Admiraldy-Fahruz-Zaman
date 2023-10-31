import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/services/ergast_api_service.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';
import 'package:miniproject_f1pulse/widgets/races_component/race_list.dart';

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
    _raceDataFuture = ErgastAPI().getRaceData();
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
                            Get.toNamed('/upcomingRaceDetails',
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
                            Get.toNamed('/pastRaceDetails',
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
