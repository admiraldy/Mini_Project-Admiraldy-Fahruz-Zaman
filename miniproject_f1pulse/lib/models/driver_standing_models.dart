import 'dart:convert';
import 'package:http/http.dart' as http;

class DriverStanding {
  final int position;
  final String driverName;
  final String constructorName;
  final int points;
  final String colorScheme;
  final String driverImage;

  DriverStanding({
    required this.position,
    required this.driverName,
    required this.constructorName,
    required this.points,
    required this.colorScheme,
    required this.driverImage,
  });

  factory DriverStanding.fromJson(Map<String, dynamic> json) {
    return DriverStanding(
      position: int.parse(json['position']),
      driverName:
          json['Driver']['givenName'] + ' ' + json['Driver']['familyName'],
      constructorName: json['Constructors'][0]['name'],
      points: int.parse(json['points']),
      colorScheme: TeamColor.get(json['Constructors'][0]['name']),
      driverImage: 'assets/images/drivers/${json['Driver']['driverId']}.png',
    );
  }
}

Future<List<DriverStanding>> fetchDriverStandings() async {
  final response = await http
      .get(Uri.parse('http://ergast.com/api/f1/current/driverStandings.json'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final driverStandings = data['MRData']['StandingsTable']['StandingsLists']
        [0]['DriverStandings'] as List<dynamic>;
    return driverStandings
        .map((json) => DriverStanding.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to fetch driver standings');
  }
}

class TeamColor {
  static Map<String, String> colors = {
    'Alfa Romeo': '#960000',
    'AlphaTauri': '#0B2A5B',
    'Alpine F1 Team': '#0090FF',
    'Aston Martin': '#006F62',
    'Ferrari': '#DC0000',
    'Haas F1 Team': '#B6BABD',
    'McLaren': '#FF8700',
    'Mercedes': '#00D2BE',
    'Red Bull Racing': '#0600EF',
    'Williams': '#005AFF',
  };

  static String get(String teamName) {
    return colors[teamName] ?? '#e10600';
  }
}
