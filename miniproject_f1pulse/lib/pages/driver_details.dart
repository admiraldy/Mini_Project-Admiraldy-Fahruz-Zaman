import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/driver_standing_models.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:miniproject_f1pulse/services/news_api_service.dart';
import 'package:miniproject_f1pulse/widgets/driver_card.dart';
import 'package:miniproject_f1pulse/widgets/news_card.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController newsScrollController = ScrollController();
    final DriverStanding driver =
        ModalRoute.of(context)!.settings.arguments as DriverStanding;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                                child: NewsCard(
                                  title: news[index].title,
                                  image: news[index].urlToImage,
                                ));
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
      ),
    );
  }
}
