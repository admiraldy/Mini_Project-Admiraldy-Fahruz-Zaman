import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/models/race_models.dart';

class RacingTab extends StatelessWidget {
  const RacingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: RaceAPI().getRace(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Race> race = snapshot.data as List<Race>;
            return ListView.builder(
              itemCount: race.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 8, right: 8, top: 10),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [],
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
    );
  }
}
