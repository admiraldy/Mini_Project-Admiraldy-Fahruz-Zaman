import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/constructor_standing_models.dart';
import 'package:miniproject_f1pulse/models/driver_standing_models.dart';

class StandingTab extends StatelessWidget {
  const StandingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Driver'),
                Tab(text: 'Constructor'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Display driver standing
              FutureBuilder(
                  future: fetchDriverStandings(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DriverStanding> driverStandings =
                          snapshot.data as List<DriverStanding>;
                      return ListView.builder(
                        itemCount: driverStandings.length,
                        itemBuilder: (context, index) {
                          return Standingstable(
                              position: driverStandings[index].position,
                              constructionColor: Color(int.parse(
                                  driverStandings[index]
                                      .colorScheme
                                      .replaceAll('#', '0xFF'))),
                              title: driverStandings[index].driverName,
                              subtitle: driverStandings[index].constructorName,
                              image: driverStandings[index].driverImage,
                              points: driverStandings[index].points);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              // Display constructor standing
              FutureBuilder(
                  future: fetchConstructorStandings(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      List<ConstructorStanding> constructorStandings =
                          snapshot.data as List<ConstructorStanding>;
                      return ListView.builder(
                        itemCount: constructorStandings.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 25,
                                          child: Text(
                                              constructorStandings[index]
                                                  .position
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 5,
                                          color: Color(int.parse(
                                              constructorStandings[index]
                                                  .colorScheme
                                                  .replaceAll('#', '0xFF'))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              constructorStandings[index]
                                                  .constructorName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '${constructorStandings[index].points.toString()} PTS',
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )),
                                        Image.asset(
                                          constructorStandings[index]
                                              .constructorImages,
                                          height: 50,
                                        )
                                      ],
                                    )),
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
            ],
          ),
        ));
  }
}

class Standingstable extends StatelessWidget {
  final int position;
  final Color constructionColor;
  final String title;
  final String? subtitle;
  final String image;
  final int points;
  const Standingstable({
    super.key,
    required this.position,
    required this.constructionColor,
    required this.title,
    this.subtitle,
    required this.image,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 25,
                child: Text(position.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 40,
                width: 5,
                color: constructionColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      subtitle ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset(
                    image,
                    height: 110,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              points.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const Text(
                              'PTS',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
