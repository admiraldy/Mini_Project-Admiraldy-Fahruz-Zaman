import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/pages/race_detail_page.dart';
import 'package:miniproject_f1pulse/settings/page_routes_settings.dart';
import 'package:miniproject_f1pulse/widgets/countdown_card.dart';

class UpcomingRaceCard extends StatelessWidget {
  const UpcomingRaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CustomPageRoute(
            builder: (context) => const RaceDetails(),
            settings: const RouteSettings(name: '/raceDetails')));
      },
      child: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/card.png'),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Next race: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '23-26 May 2021',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mexico',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'FORMULA 1 GRAN PREMIO DE MÉXICO 2023',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 45,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CountdownCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
