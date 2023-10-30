import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject_f1pulse/theme/team_color_theme.dart';

class ConstructorStanding {
  final int position;
  final String constructorName;
  final int points;
  final String constructorImages;
  final String colorScheme;

  ConstructorStanding(
      {required this.position,
      required this.constructorName,
      required this.points,
      required this.constructorImages,
      required this.colorScheme});

  factory ConstructorStanding.fromJson(Map<String, dynamic> json) {
    return ConstructorStanding(
      position: int.parse(json['position']),
      constructorName: json['Constructor']['name'],
      points: int.parse(json['points']),
      constructorImages:
          'assets/images/constructor/${json['Constructor']['constructorId']}.png',
      colorScheme: TeamColor.get(json['Constructor']['name']),
    );
  }
}

Future<List<ConstructorStanding>> fetchConstructorStandings() async {
  final response = await http.get(
      Uri.parse('http://ergast.com/api/f1/current/constructorStandings.json'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final standings = data['MRData']['StandingsTable']['StandingsLists'][0]
        ['ConstructorStandings'] as List<dynamic>;

    return standings
        .map((standing) => ConstructorStanding.fromJson(standing))
        .toList();
  } else {
    throw Exception('Failed to load constructor standings');
  }
}
