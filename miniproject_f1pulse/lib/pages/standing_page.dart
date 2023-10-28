import 'package:flutter/material.dart';
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
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 25,
                                      child: Text(
                                          driverStandings[index]
                                              .position
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 5,
                                      color: Color(int.parse(
                                          driverStandings[index]
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
                                            driverStandings[index].driverName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            driverStandings[index]
                                                .constructorName,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        Image.asset(
                                          driverStandings[index].driverImage,
                                          height: 110,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 60,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    driverStandings[index]
                                                        .points
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                  const Text(
                                                    'PTS',
                                                    style:
                                                        TextStyle(fontSize: 12),
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
            ],
          ),
        ));
  }
}
