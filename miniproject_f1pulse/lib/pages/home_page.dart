import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/services/news_api_service.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';
import 'package:miniproject_f1pulse/widgets/upcoming_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController newsScrollController = ScrollController();
    RaceAPI race = RaceAPI();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        title: Text(
          'F1Pulse',
          style: TextAppStyle().headerStye(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: race.getRaceData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Race> races = snapshot.data as List<Race>;
                    Race nearestRace = races.firstWhere(
                        (race) => race.date.isAfter(DateTime.now()),
                        orElse: () => races.last);
                    String raceDate =
                        DateFormat('dd MMMM yyyy').format(nearestRace.date);
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/upcomingRaceDetails',
                          arguments: nearestRace,
                        );
                      },
                      child: UpcomingRaceCard(
                        date: raceDate,
                        raceName: nearestRace.raceName,
                        circuitName: nearestRace.circuitName,
                        raceTime: nearestRace.time,
                        firstPracticeTime:
                            nearestRace.firstPractice ?? DateTime.now(),
                        secondPracticeTime:
                            nearestRace.secondPractice ?? DateTime.now(),
                        thirdPracticeTime:
                            nearestRace.thirdPractice ?? DateTime.now(),
                        qualifyingTime:
                            nearestRace.qualifying ?? DateTime.now(),
                        sprintTime: nearestRace.qualifying ?? DateTime.now(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(height: 10),
            const Text(
              'Top Stories',
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
                future: NewsApiService().fetchNews('formula 1'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<NewsModel> news = snapshot.data as List<NewsModel>;
                    return ListView.builder(
                        controller: newsScrollController,
                        shrinkWrap: true,
                        itemCount: news.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/newsDetails',
                                  arguments: news[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 8, right: 8),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(10)),
                                          child: Image.network(
                                              news[index].urlToImage)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15,
                                            left: 8,
                                            right: 8,
                                            bottom: 20),
                                        child: Text(
                                          news[index].title,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
