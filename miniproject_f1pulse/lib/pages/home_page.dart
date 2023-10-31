import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/controller/controller.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';
import 'package:miniproject_f1pulse/widgets/news_card.dart';
import 'package:miniproject_f1pulse/widgets/upcoming_card.dart';

class HomeTab extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  HomeTab({super.key});

  void userSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController newsScrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        title: Text(
          'F1Pulse',
          style: TextAppStyle().headerStye(),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: userSignOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.raceData.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                Race nearestRace = controller.raceData.firstWhere(
                    (race) => race.date.isAfter(DateTime.now()),
                    orElse: () => controller.raceData.last);
                String raceDate =
                    DateFormat('dd MMMM yyyy').format(nearestRace.date);
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/upcomingRaceDetails', arguments: nearestRace);
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
                    qualifyingTime: nearestRace.qualifying ?? DateTime.now(),
                    sprintTime: nearestRace.qualifying ?? DateTime.now(),
                  ),
                );
              }
            }),
            const SizedBox(height: 10),
            const Text(
              'Top Stories',
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.newsData.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<NewsModel> news = controller.newsData;
                return ListView.builder(
                    controller: newsScrollController,
                    shrinkWrap: true,
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/newsDetails', arguments: news[index]);
                        },
                        child: NewsCard(
                            image: news[index].urlToImage,
                            title: news[index].title),
                      );
                    });
              }
            }),
          ],
        ),
      ),
    );
  }
}
