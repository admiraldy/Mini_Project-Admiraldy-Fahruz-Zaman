import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/driver_standing_models.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:miniproject_f1pulse/pages/past_race_details_page.dart';
import 'package:miniproject_f1pulse/services/news_api_service.dart';
import 'package:miniproject_f1pulse/services/open_ai_service.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController newsScrollController = ScrollController();
    final DriverStanding driver =
        ModalRoute.of(context)!.settings.arguments as DriverStanding;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Info'),
            Tab(
              text: 'Media',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                DriverCard(
                  driverName: driver.driverName,
                  constructorName: driver.constructorName,
                  driverImage: driver.driverImage,
                ),
                // show the openai output
                Card(
                  child: FutureBuilder<String>(
                    future: fetchDriverDetails(
                        driver.driverName, driver.constructorName),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            snapshot.data ?? 'No information available.',
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder(
                future: NewsApiService().fetchNews(driver.driverName),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<NewsModel> news = (snapshot.data ?? []);
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
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
