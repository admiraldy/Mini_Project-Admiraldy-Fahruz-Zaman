import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject_f1pulse/controller/controller.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';
import 'package:miniproject_f1pulse/widgets/standings.dart';

class StandingTab extends StatelessWidget {
  const StandingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              'Standings',
              style: TextAppStyle().headerStye(),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Driver'),
                Tab(text: 'Constructor'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GetBuilder<DriverStandingController>(
                init: DriverStandingController(),
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.hasError.value) {
                    return const Text('Error');
                  } else {
                    return ListView.builder(
                      itemCount: controller.driverStandings.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/driverDetails',
                              arguments: controller.driverStandings[index],
                            );
                          },
                          child: DriverStandingsTable(
                              position:
                                  controller.driverStandings[index].position,
                              constructionColor: Color(int.parse(controller
                                  .driverStandings[index].colorScheme
                                  .replaceAll('#', '0xFF'))),
                              title:
                                  controller.driverStandings[index].driverName,
                              subtitle: controller
                                  .driverStandings[index].constructorName,
                              image:
                                  controller.driverStandings[index].driverImage,
                              points: controller.driverStandings[index].points),
                        );
                      },
                    );
                  }
                },
              ),
              // Display constructor standing
              GetBuilder<ConstructorStandingController>(
                init: ConstructorStandingController(),
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.hasError.value) {
                    return const Text('Error');
                  } else {
                    return ListView.builder(
                      itemCount: controller.constructorStandings.length,
                      itemBuilder: (context, index) {
                        return ConstructorStandingTable(
                            position:
                                controller.constructorStandings[index].position,
                            constructorName: controller
                                .constructorStandings[index].constructorName,
                            points:
                                controller.constructorStandings[index].points,
                            constructorImages: controller
                                .constructorStandings[index].constructorImages,
                            colorScheme: controller
                                .constructorStandings[index].colorScheme);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
