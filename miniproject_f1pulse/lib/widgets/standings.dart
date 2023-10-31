import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';

class DriverStandingsTable extends StatelessWidget {
  final int position;
  final Color constructionColor;
  final String title;
  final String subtitle;
  final String image;
  final int points;
  const DriverStandingsTable({
    super.key,
    required this.position,
    required this.constructionColor,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 30,
                child: Text(position.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
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
                      style: TextAppStyle().titleStyle(),
                    ),
                    Text(
                      subtitle,
                      style: TextAppStyle().subtitleStyle(),
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
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.red,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConstructorStandingTable extends StatelessWidget {
  final int position;
  final String constructorName;
  final int points;
  final String constructorImages;
  final String colorScheme;
  const ConstructorStandingTable({
    super.key,
    required this.position,
    required this.constructorName,
    required this.points,
    required this.constructorImages,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
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
                    child: Text(position.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 40,
                    width: 5,
                    color:
                        Color(int.parse(colorScheme.replaceAll('#', '0xFF'))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        constructorName,
                        style: TextAppStyle().titleStyle(),
                      ),
                      Text(
                        '$points PTS',
                        style: TextAppStyle().subtitleStyle(),
                      ),
                    ],
                  )),
                  Image.asset(
                    constructorImages,
                    height: 50,
                  )
                ],
              )),
        ));
  }
}
